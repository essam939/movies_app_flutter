import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/services/services_locator.dart';
import 'package:movieapp/movies/presentation/component/populare_component.dart';
import 'package:movieapp/movies/presentation/controller/movies_bloc/movies_bloc.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()..add(GetPopularMoviesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Movies'),
        ),
        body: const PopularComponent(),
      ),
    );
  }
}
