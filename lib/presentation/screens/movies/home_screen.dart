import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:verifarma_cine_app/presentation/providers/movies/movies_provider.dart';
import 'package:verifarma_cine_app/presentation/providers/movies/movies_slideshow_provider.dart';
import 'package:verifarma_cine_app/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    final slideShowMovies = ref.watch(moviesSlideshowProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomAppbar(),
    
          MoviesSlideshow(movies: slideShowMovies),
          
          MovieHorizontalListview(
              movies: nowPlayingMovies,
              title: 'En cines',
              subTitle: 'Junio',
              loadNextPage: () =>
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage()),
    
          MovieHorizontalListview(
              movies: nowPlayingMovies,
              title: 'En cines',
              subTitle: 'Julio',
              loadNextPage: () =>
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage()),

                  const SizedBox(height: 20),
        ],
      ),
    );
  }
}
