import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/domain/entities/entities.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';

// Define the provider
final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  //Listen the repository provider for the function to get the information
  final movieRepository = ref.watch(movieRepositoryProvider);
  // pass the referene to the function.
  return MovieMapNotifier(getMovie: movieRepository.getMovieById);
});

//Define callback for this notifier
typedef GetMovieCallback = Future<Movie> Function(String movieId);

/// This class notifier the movie and save the movies previous load on map like this:
/// movieId: Movie()
/// movieId: Movie()
/// movieId: Movie()
class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallback getMovie;
  // Init with state empty
  MovieMapNotifier({required this.getMovie}) : super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;
    // Call the function from get the information.
    final movie = await getMovie(movieId);
    //Udate the state with the new movie
    state = {...state, movieId: movie};
  }
}
