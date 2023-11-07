import 'package:dio/dio.dart';

import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';

import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

class MoviedbDatasource extends MoviesDatasource {
  // Dio is similar to axios on react native.
  final dio = Dio(BaseOptions(
      baseUrl: Environment.movieDbApiUrl,
      queryParameters: {
        'api_key': Environment.movieDbKey,
        'language': 'es-MX' // We can change this parameter for other language.
      }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    // We can move to constants by sections
    final response = await dio.get('/movie/now_playing');
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    return movies;
  }
}
