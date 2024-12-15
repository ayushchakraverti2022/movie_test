import 'package:flutter/material.dart';
import 'package:movie_test/colors/color.dart';
import 'package:movie_test/fonts/font.dart';
import 'package:movie_test/logic/cubit/cubit/search_cubit.dart';
import 'package:movie_test/logic/cubit/home_cubit.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_test/pages/detail.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController? inputcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.Black(),
        title: Text(
          'Search',
          style: Fonts.HeadlineTextFeildStyle(),
        ),
      ),
      body: Stack(
        children: [

          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchMovieLoaded) {
                final movies = state.movies;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 65),
                              height: MediaQuery.sizeOf(context).height,
                        child: ListView.builder(
                          itemCount: movies.length,
                          itemBuilder: (context, index) {
                            final movie = movies[index];
                            return GestureDetector(
                              onTap: () {
                                Get.to(Detail(movie: movie));
                              },
                              child: Card(
                                margin: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Movie Image
                                    Center(
                                      child: Container(
                                        width: 100,
                                        height: 150,
                                        margin: const EdgeInsets.all(8.0),
                                        child: movie.image?.medium != null
                                            ? Container(
                                                width: 100,
                                                height: 150,
                                                margin: const EdgeInsets.all(8.0),
                                                child: Image.network(
                                                  movie.image!.original,
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                            : const Icon(Icons.movie),
                                      ),
                                    ),
                                    // Movie Details
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            // Movie Title
                                            Text(
                                              movie.name,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            // Genres
                                            Text(
                                              "Genres: ${movie.genres.isNotEmpty ? movie.genres.join(', ') : 'N/A'}",
                                              style: TextStyle(color: Colors.grey[700]),
                                            ),
                                            const SizedBox(height: 1),
                                            // Movie Summary
                                            Text(
                                              "Language: ${movie.language.isNotEmpty}",
                                              style: TextStyle(color: Colors.grey[700]),
                                            ),
                                            const SizedBox(height: 1),
                                            Text(
                                              "Status: ${movie.status}",
                                              style: TextStyle(color: Colors.grey[700]),
                                            ),
                                            const SizedBox(height: 1),
                                            Text(
                                              "Summary: ${movie.summary}",
                                              style: TextStyle(color: Colors.grey[700]),
                                            ),
                                            const SizedBox(height: 1),
                                            Text(
                                              "Rating: ${movie.rating ?? 'N/A'}",
                                              style: TextStyle(color: Colors.grey[700]),
                                            ),
                                            const SizedBox(height: 1),
                                            Text(
                                              movie.premiered ?? 'Unknown',
                                              style: TextStyle(color: Colors.grey[700]),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is SearchMovieError) {
                return Center(child: Text('Error: ${state.message}'));
              }
              return const Center();
            },
          ),
          Card(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Form(
                        key: _formKey,
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Search movies";
                                    }
                                    return null;
                                  },
                                  controller: inputcontroller,
                                  decoration: InputDecoration(
                                    hintText: "Search movies",
                                    hintStyle: Fonts.LightTextFeildStyle(),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  String? name =
                                      inputcontroller?.value.text.toString();
                                  BlocProvider.of<SearchCubit>(context)
                                      .fetchSearchMovies(name!);
                                }
                              },
                              child: const Icon(
                                Icons.search,
                                size: 25,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
