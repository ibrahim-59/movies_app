class ApiConstance {
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const apiKey = '6716052ed8200304389825349dfda126';
  static const nowPlayingMoviesPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const popularMoviesPath = '$baseUrl/movie/popular?api_key=$apiKey';
  static const topRatedMoviesPath = '$baseUrl/movie/top_rated?api_key=$apiKey';
  static String movieDetailsPath(int moviId) =>
      '$baseUrl/movie/$moviId?api_key=$apiKey';
  static String movieRecommindationsPath(int moviId) =>
      '$baseUrl/movie/$moviId/recommendations?api_key=$apiKey';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path) => '$baseImageUrl$path';
}
