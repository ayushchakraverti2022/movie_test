import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_test/fonts/font.dart';
import 'package:movie_test/logic/cubit/home_cubit.dart';
import 'package:movie_test/pages/detail.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomeCubit>(context).fetchHomeMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Movies List",
          
          style: Fonts.HeadlineTextFeildStyle(),
        ),
      ),
      
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeMovieLoaded) {
            final movies = state.movies;
            return ListView.builder(
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
                            "Language: ${movie.language.isNotEmpty }",
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
                          Text("Rating: ${movie.rating ?? 'N/A'}",style: TextStyle(color: Colors.grey[700]),
                          ),
                          const SizedBox(height: 1),
                          Text(movie.premiered ?? 'Unknown',style: TextStyle(color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ),
                  )
                                ],
                              ),
                  
                    // child: ListTile(
                    //   leading: movie.image?.medium != null
                    //       ? Container(                                         
                    //           child: Image.network(
                    //             movie.image!.original,
                    //             fit: BoxFit.fill, 
                    //             scale:1.8,                             
                    //           ),
                    //         )
                    //       : const Icon(Icons.movie), // Fallback for missing image
                    //   title: Text(movie.name, style: TextStyle(
                    //             fontSize: 18,
                    //             fontWeight: FontWeight.bold,
                    //           ),),
                    //   subtitle: Text(
                    //     "Genres: ${movie.genres.isNotEmpty ? movie.genres.join(', ') : 'N/A'}\n"
                    //     "Language: ${movie.language}\n"
                    //     "Status: ${movie.status}\n"
                    //     "Summary: ${movie.summary}\n"
                    //     "Rating: ${movie.rating ?? 'N/A'}",
                    //   ),
                    //   trailing: Text(movie.premiered ?? 'Unknown'),
                    // ),
                  ),
                );
              },
            );
          } else if (state is HomeMovieError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
   
    );
  }
}
