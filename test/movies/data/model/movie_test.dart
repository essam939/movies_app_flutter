import 'package:flutter_test/flutter_test.dart';
import 'package:movieapp/movies/data/model/movie.dart';

void main() {
  group('Movie class', () {
    
    final sampleJson = {
      "id": 1,
      "title": "Test Movie",
      "backdrop_path": "/testBackdrop.jpg",
      "overview": "This is a test overview.",
      "release_date": "2023-09-08",
      "vote_average": 8.5
    };

    const movie = Movie(
      id: 1,
      title: "Test Movie",
      backdropPath: "/testBackdrop.jpg",
      overView: "This is a test overview.",
      releaseDate: "2023-09-08",
      voteAvrage: 8.5,
    );

    test('fromJson creates a Movie from JSON', () {
      final result = Movie.fromJson(sampleJson);
      expect(result, movie);
    });

    test('toJson converts a Movie to JSON', () {
      final result = movie.toJson();
      expect(result, sampleJson);
    });

    test('props are correctly implemented', () {
      expect(movie.props, [1, "Test Movie", "/testBackdrop.jpg", "This is a test overview.", 8.5, "2023-09-08"]);
    });

    test('Movies with the same properties are considered equal', () {
      const anotherMovie = Movie(
        id: 1,
        title: "Test Movie",
        backdropPath: "/testBackdrop.jpg",
        overView: "This is a test overview.",
        releaseDate: "2023-09-08",
        voteAvrage: 8.5,
      );
      expect(movie, anotherMovie);
    });
  });
}
