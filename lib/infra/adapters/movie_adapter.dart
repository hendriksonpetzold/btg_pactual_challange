import 'package:btg_pactual_challange/domain/entities/movie_entity.dart';

class MovieAdapter {
  static MovieEntity fromMap(Map<String, dynamic> map) {
    return MovieEntity(
      image: map['poster_path'] as String,
      name: map['title'] as String,
      releaseDate: map['release_date'] as String,
      overview: map['overview'] as String,
      voteAverage: double.parse(map['vote_average'].toString()),
      genreIds: (map['genre_ids'].cast<int>()),
    );
  }
}
