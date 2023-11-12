import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

/// Callback for search movies.
typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

///This delegate manage the section for search a movie.
class SearchMovieDelegate extends SearchDelegate {
  final SearchMoviesCallback searchMovies;
  // List<Movie> initialMovies;

  SearchMovieDelegate({
    required this.searchMovies,
    // required this.initialMovies,
  }) : super(
          searchFieldLabel: 'Search Movie',
          // textInputAction: TextInputAction.done
        );

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
          //clearStreams();
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
    return FutureBuilder(
      future: searchMovies(query),
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return _MovieItem(
              movie: movie,
              onMovieSelected: (context, movie) {
                //clearStreams();
                close(context, movie);
              },
            );
          },
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
