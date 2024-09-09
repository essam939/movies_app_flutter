import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/services/injection.dart';
import 'package:movieapp/movies/presentation/component/populare_component.dart';
import 'package:movieapp/movies/presentation/controller/movies_bloc/movies_bloc.dart';
import 'package:movieapp/movies/presentation/screens/search_screen.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MoviesBloc>()..add(GetPopularMoviesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Movies'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SearchScreen(moviesBloc: getIt<MoviesBloc>())));
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
        body: const PopularComponent(),
      ),
    );
  }
}
