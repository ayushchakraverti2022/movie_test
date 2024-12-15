import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_test/model/home_movie.dart';

class HomeMovieRepository {
   static String apiUrl = "https://api.tvmaze.com/search/shows?q=all";

   static Future<List<HomeMovie>> fetchMovies() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => HomeMovie.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load movies");
      }
    } catch (e) {
      throw Exception("Error fetching movies: $e");
    }
  }
}
