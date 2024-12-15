part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class SearchMovieInitial extends SearchState {}

final class SearchMovieLoading extends SearchState {}

final class SearchMovieLoaded extends SearchState {
  final List<HomeMovie> movies;

  SearchMovieLoaded(this.movies);
}

final class SearchMovieError extends SearchState {
  final String message;

  SearchMovieError(this.message);
}
