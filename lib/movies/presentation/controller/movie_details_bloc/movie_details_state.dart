// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String message;
  const MovieDetailsState(
      {this.movieDetails,
      this.movieDetailsState = RequestState.loading,
      this.message = "",
      });

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        message,
  
      ];

  MovieDetailsState copyWith(
      {MovieDetails? movieDetails,
      RequestState? movieDetailsState,
      String? message,
      }) {
    return MovieDetailsState(
        movieDetails: movieDetails ?? this.movieDetails,
        movieDetailsState: movieDetailsState ?? this.movieDetailsState,
        message: message ?? this.message,
          );
  }
}
