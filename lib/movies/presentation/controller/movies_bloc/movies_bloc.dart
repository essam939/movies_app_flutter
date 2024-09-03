import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/usecase/base_use_case.dart';
import 'package:movieapp/core/utilis/enums.dart';
import 'package:movieapp/movies/data/model/movie.dart';
import 'package:movieapp/movies/domian/usecase/get_pupulare_movies.dart';
import 'package:movieapp/movies/domian/usecase/search_on_movie.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetPupulareMoviesUseCase getPupulareMoviesUseCase;
  final SearchOnMovieUseCase searchOnMovieUseCase;
  MoviesBloc(this.getPupulareMoviesUseCase, this.searchOnMovieUseCase)
      : super(const MoviesState()) {
    on<GetPopularMoviesEvent>(_getPopulareMovies);
    on<SearchOnMovieEvent>(_searchOnMovie);
  }

  FutureOr<void> _getPopulareMovies(event, emit) async {
    final result = await getPupulareMoviesUseCase(const NoParameters());
    result.fold(
        (l) => emit(
              state.copyWith(
                populareState: RequestState.error,
                popularegMessage: l.message,
              ),
            ),
        (r) => emit(
              state.copyWith(
                  populareMovies: r, populareState: RequestState.loaded),
            ));
  }

  FutureOr<void> _searchOnMovie(event, emit) async {
    final result = await searchOnMovieUseCase(
        SearchOnMovieParameters(movieName: event.movieName));

    result.fold(
        (l) => emit(
              state.copyWith(
                searchState: RequestState.error,
                searchMessage: l.message,
              ),
            ),
        (r){
           emit(
              state.copyWith(searchMovies: r, searchState: RequestState.loaded),
            );
        });
  }
}
