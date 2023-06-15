import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:verifarma_cine_app/domain/entities/movie.dart';
import 'package:verifarma_cine_app/presentation/providers/movies/movies_repository_provider.dart';

final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final movieRepository = ref.watch( movieRepositoryProvider );
  return MovieMapNotifier(getMovie: movieRepository.getMovieById );
});


/*
  {
    '505642': Movie(),
    '505643': Movie(),
    '505645': Movie(),
    '501231': Movie(),
  }
*/

typedef GetMovieCallback = Future<Movie>Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String,Movie>> {

  final GetMovieCallback getMovie;

  MovieMapNotifier({
    required this.getMovie,
  }): super({});


  Future<void> loadMovie( String movieId ) async {
    if ( state[movieId] != null ) return;
    final movie = await getMovie( movieId );
    state = { ...state, movieId: movie };
  }

}