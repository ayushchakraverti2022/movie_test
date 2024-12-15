import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_test/model/home_movie.dart';
import 'package:movie_test/service/search.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  Future<void> fetchSearchMovies(String name) async {
    emit(SearchMovieLoading());
    try {
      final movies = await SearchMovieRepository.fetchMovies(name);
      emit(SearchMovieLoaded(movies));
    } catch (e) {
      emit(SearchMovieError(e.toString()));
    }
  }

}
