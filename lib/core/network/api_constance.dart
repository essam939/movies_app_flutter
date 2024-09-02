class ApiConstance {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const apiKey = "a7f312668ca01142583c477e700a5521";
  static const String getPopularMoviesPath ="$baseUrl/movie/popular?api_key=$apiKey";
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static String movieDetailsPath(int movieId) =>"$baseUrl/movie/$movieId?api_key=$apiKey";
  static String imageUrl(String path) => '$baseImageUrl$path';
}
