class MovieEntity {
  String image;
  String name;
  String releaseDate;
  String overview;
  double voteAverage;
  List<int> genreIds;
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
