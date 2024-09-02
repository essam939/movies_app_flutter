// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlaingMovies;
  final RequestState nowPlaingState;
  final String nowPlaingMessage;
  final List<Movie> populareMovies;
  final RequestState populareState;
  final String popularegMessage;
  final List<Movie> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;
  const MoviesState({
    this.nowPlaingMovies = const [],
    this.nowPlaingState = RequestState.loading,
    this.nowPlaingMessage = "",
    this.populareMovies = const [],
    this.populareState = RequestState.loading,
    this.popularegMessage = "",
    this.topRatedMovies = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = "",
  });

  @override
  List<Object> get props => [
        nowPlaingMovies,
        nowPlaingState,
        nowPlaingMessage,
        populareMovies,
        populareState,
        popularegMessage,
        topRatedMovies,
        topRatedState,
        topRatedMessage
      ];


  MoviesState copyWith({
    List<Movie>? nowPlaingMovies,
    RequestState? nowPlaingState,
    String? nowPlaingMessage,
    List<Movie>? populareMovies,
    RequestState? populareState,
    String? popularegMessage,
    List<Movie>? topRatedMovies,
    RequestState? topRatedState,
    String? topRatedMessage,
  }) {
    return MoviesState(
      nowPlaingMovies: nowPlaingMovies ?? this.nowPlaingMovies,
      nowPlaingState: nowPlaingState ?? this.nowPlaingState,
      nowPlaingMessage: nowPlaingMessage ?? this.nowPlaingMessage,
      populareMovies: populareMovies ?? this.populareMovies,
      populareState: populareState ?? this.populareState,
      popularegMessage: popularegMessage ?? this.popularegMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }
}
