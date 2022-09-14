// ignore_for_file: public_member_api_docs, sort_constructors_first
class MovieEntity {
  final String image;
  final String name;
  final String releaseDate;
  final String overview;
  final double voteAverage;
  final List<int> genreIds;
  MovieEntity({
    required this.image,
    required this.name,
    required this.releaseDate,
    required this.overview,
    required this.voteAverage,
    required this.genreIds,
  });

  @override
  String toString() {
    return 'MovieEntity(image: $image, name: $name, releaseDate: $releaseDate, overview: $overview, voteAverage: $voteAverage, genreIds: $genreIds)';
  }
}
