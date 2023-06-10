import 'package:dio/dio.dart';
import 'package:verifarma_cine_app/domain/datasources/movies_datasources.dart';
import 'package:verifarma_cine_app/domain/entities/movie.dart';

import '../../config/constants/environment.dart';


class MoviedbDatasource extends MoviesDatasource{

    final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-ES'
    }
  ));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    
    final response = await dio.get('/movie/now_playing');

        final List<Movie> movies = [];



    return movies;
  }}