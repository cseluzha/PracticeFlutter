import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';

// Provider for save the query search
final searchQueryProvider = StateProvider<String>((ref) => '');

// Provider for save the movies searched
final searchedMoviesProvider =
    StateNotifierProvider<SearchedMoviesNotifier, List<Movie>>((ref) {
      //listen the provider for search movies.
  final movieRepository = ref.read(movieRepositoryProvider);

  return SearchedMoviesNotifier(
      searchMovies: movieRepository.searchMovies, ref: ref);
});

// Callback for movies searched.
typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

/*
Class that will allow us to have the list of movies that were consulted and left the search section.
*/
class SearchedMoviesNotifier extends StateNotifier<List<Movie>> {
  final SearchMoviesCallback searchMovies;
  final Ref ref;

  SearchedMoviesNotifier({
    required this.searchMovies,
    required this.ref,
  }) : super([]);

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    final List<Movie> movies = await searchMovies(query);
    //Update the state for the query
    ref.read(searchQueryProvider.notifier).update((state) => query);

// Save the last movies searched
    state = movies;
// Return the movies.
    return movies;
  }
}
