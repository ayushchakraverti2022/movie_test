// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movie_test/fonts/font.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:movie_test/model/home_movie.dart';
class Detail extends StatelessWidget {
   final HomeMovie movie;

  const Detail({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              // if (from != 'entrance') {
                Navigator.pop(context);
              // }
            },
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            )),
        backgroundColor: Colors.black,
        title: Text(
        movie.name,          
          style: Fonts.HeadlineTextFeildStyle(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie Poster
            if (movie.image?.original != null)
              Center(
                child: Image.network(
                  movie.image!.original,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              )
            else
              const Center(
                child: Icon(
                  Icons.movie,
                  size: 100,
                ),
              ),
            const SizedBox(height: 16.0),

            // Title
            Text(
              movie.name,
              style: Fonts.HeadlineTextFeildStyle2(),
            ),
            const SizedBox(height: 8.0),

            // Genres
            if (movie.genres.isNotEmpty)
              Text(
                "Genres: ${movie.genres.join(', ')}",
                style: Theme.of(context).textTheme.titleMedium,
              ),

            const SizedBox(height: 8.0),

            // Status and Type
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Status: ${movie.status}"),
                Text("Type: ${movie.type}"),
              ],
            ),

            const Divider(height: 24.0, thickness: 1.0),

            // Language, Runtime, and Average Runtime
            Text("Language: ${movie.language}"),
            if (movie.runtime != null) Text("Runtime: ${movie.runtime} mins"),
            if (movie.averageRuntime != null)
              Text("Average Runtime: ${movie.averageRuntime} mins"),

            const Divider(height: 24.0, thickness: 1.0),

            // Premiered and Ended
            if (movie.premiered != null)
              Text("Premiered: ${movie.premiered}"),
            if (movie.ended != null) Text("Ended: ${movie.ended}"),

            const Divider(height: 24.0, thickness: 1.0),

            // Rating
            if (movie.rating != null)
              Text("Rating: ${movie.rating}"),
            const SizedBox(height: 8.0),

            // Network Information
            if (movie.network != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Network: ${movie.network!.name}"),
                  Text(
                      "Country: ${movie.network!.country} (${movie.network!.timezone})"),
                ],
              ),

            const Divider(height: 24.0, thickness: 1.0),

            // Summary
            if (movie.summary != null)
              Text(
                "Summary",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            if (movie.summary != null)
              Text(
                movie.summary!,
                style: const TextStyle(height: 1.5),
              ),

            const Divider(height: 24.0, thickness: 1.0),

            // Previous and Next Episode
            if (movie.previousEpisodeName != null)
              Text("Previous Episode: ${movie.previousEpisodeName}"),
            if (movie.nextEpisodeName != null)
              Text("Next Episode: ${movie.nextEpisodeName}"),

            const Divider(height: 24.0, thickness: 1.0),

            // Official Site
            if (movie.officialSite != null)
              GestureDetector(
                onTap: () {
                  // Launch official site
                  final url = Uri.parse(movie.officialSite!);
                  if (url.isAbsolute) {
                    launchUrl(url);
                  }
                },
                child: Text(
                  "Visit Official Site",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}