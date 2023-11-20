import 'package:cinemapedia/domain/entities/entities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'movies_providers.dart';

// Provider  with riverpod have all providers and only use to neccesary.
final moviesSlideshowProvider = Provider<List<Movie>>((ref){
  //Listen the now playing provider 
  final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );

  if ( nowPlayingMovies.isEmpty ) return [];
// return to sub list of movies
  return nowPlayingMovies.sublist(0,7);
});