import 'dart:async';
import 'package:animate_do/animate_do.dart';

import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

/// Callback for search movies.
typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

///This delegate manage the section for search a movie.
class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMoviesCallback searchMovies;
  // List<Movie> initialMovies;

  StreamController<List<Movie>> debouncedMovies = StreamController.broadcast();
  StreamController<bool> isLoadingStream = StreamController.broadcast();

  Timer? _debounceTimer;

  SearchMovieDelegate({
    required this.searchMovies,
   // required this.initialMovies,
  }) : super(
          searchFieldLabel: 'Search Movie',
          // textInputAction: TextInputAction.done
        );

  void clearStreams() {
    debouncedMovies.close();
  }

// validate if the query changes for call to api for get information about movies
  void _onQueryChanged(String query) {
    isLoadingStream.add(true);
    //clean the timer
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    //create the timer
    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      // Validation only search if query have data.
      // if ( query.isEmpty ) {
      //   debouncedMovies.add([]);
      //   return;
      // }

      final movies = await searchMovies(query);
      print(movies.length);
      //initialMovies = movies;
      debouncedMovies.add(movies);
      isLoadingStream.add(false);
    });
  }

  /// Change the place holder into the input search section.
  // @override
  // String get searchFieldLabel => 'Search Movie';

  /// Actions do you want to execute on search section. Right slide
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      FadeIn(
        animate: query.isNotEmpty,
        child: IconButton(
            onPressed: () => query = '', icon: const Icon(Icons.clear)),
      )
    ];
  }

  /// Actions do you want to execute on search section. Left slide
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          clearStreams();
          close(context,
              null); // on null can you put something how return value if do you want.
        },
        icon: const Icon(Icons.arrow_back_ios_new_rounded));
  }

  /// When you click enter or search button, show the results on this override.
  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  /// If exist suggestions, can you show a suggestions on this override.
  @override
  Widget buildSuggestions(BuildContext context) {
    //Now check the query and save info.
    _onQueryChanged(query);
    /*
    In this case we need change FutureBuilder to StreamBuilder because we need to have control 
    about the call to api, we need to call only when the user need the information. 
    */
    return StreamBuilder(
      //future: searchMovies(query),
      stream: debouncedMovies.stream,
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) => _MovieItem(
              movie: movies[index],
              onMovieSelected: (context, movie) {
                clearStreams();
                close(context, movie);
              }),
        );
      },
    );
  }
}

/// Class represent a item for search section.
class _MovieItem extends StatelessWidget {
  final Movie movie;
  final Function onMovieSelected;

  const _MovieItem({required this.movie, required this.onMovieSelected});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        onMovieSelected(context, movie);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            // Image
            SizedBox(
              width: size.width * 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  movie.posterPath,
                  loadingBuilder: (context, child, loadingProgress) =>
                      FadeIn(child: child),
                ),
              ),
            ),

            const SizedBox(width: 10),

            // Description
            SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title, style: textStyles.titleMedium),
                  (movie.overview.length > 100)
                      ? Text('${movie.overview.substring(0, 100)}...')
                      : Text(movie.overview),
                  Row(
                    children: [
                      Icon(Icons.star_half_rounded,
                          color: Colors.yellow.shade800),
                      const SizedBox(width: 5),
                      Text(
                        HumanFormats.number(movie.voteAverage, 1),
                        style: textStyles.bodyMedium!
                            .copyWith(color: Colors.yellow.shade900),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
