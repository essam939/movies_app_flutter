// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final List<Movie> populareMovies;
  final RequestState populareState;
  final String popularegMessage;
  final List<Movie> searchMovies;
  final RequestState searchState;
  final String searchMessage;

  const MoviesState({
    this.populareMovies = const [],
    this.populareState = RequestState.loading,
    this.popularegMessage = "",
    this.searchMovies = const [],
    this.searchState = RequestState.loading,
    this.searchMessage = "",
  });

  @override
  List<Object> get props => [
        populareMovies,
        populareState,
        popularegMessage,
        searchMovies,
        searchState,
        searchMessage
      ];

  MoviesState copyWith({
    List<Movie>? populareMovies,
    RequestState? populareState,
    String? popularegMessage,
    List<Movie>? searchMovies,
    RequestState? searchState,
    String? searchMessage,
  }) {
    return MoviesState(
      populareMovies: populareMovies ?? this.populareMovies,
      populareState: populareState ?? this.populareState,
      popularegMessage: popularegMessage ?? this.popularegMessage,
      searchMovies: searchMovies ?? this.searchMovies,
      searchState: searchState ?? this.searchState,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }
}
