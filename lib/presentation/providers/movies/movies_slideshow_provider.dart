import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:verifarma_cine_app/domain/entities/movie.dart';
import 'package:verifarma_cine_app/presentation/providers/movies/movies_provider.dart';





final moviesSlideshowProvider = Provider<List<Movie>>((ref){
  
  final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );

  if ( nowPlayingMovies.isEmpty ) return [];

  return nowPlayingMovies.sublist(0,6);

});