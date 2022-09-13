import 'package:flutter/material.dart';

class HomeMovieCard extends StatelessWidget {
  final String image;
  final String movieName;
  final String releaseDate;
  const HomeMovieCard({
    Key? key,
    required this.image,
    required this.movieName,
    required this.releaseDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      decoration: BoxDecoration(
        image: DecorationImage(
          // fit: BoxFit.fill,
          image: NetworkImage(
            'https://image.tmdb.org/t/p/w220_and_h330_face$image',
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            movieName,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            releaseDate,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
