part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeMovieInitial extends HomeState {}

final class HomeMovieLoading extends HomeState {}

final class HomeMovieLoaded extends HomeState {
  final List<HomeMovie> movies;

  HomeMovieLoaded(this.movies);
}

final class HomeMovieError extends HomeState {
  final String message;

  HomeMovieError(this.message);
}