import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_test/model/home_movie.dart';
import 'package:movie_test/service/homeservice.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  
  Future<void> fetchHomeMovies() async {
    emit(HomeMovieLoading());
    try {
      final movies = await HomeMovieRepository.fetchMovies();
      emit(HomeMovieLoaded(movies));
    } catch (e) {
      emit(HomeMovieError(e.toString()));
    }
  }
}
