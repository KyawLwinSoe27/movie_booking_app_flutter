import 'package:flutter/material.dart';

class MovieName extends StatelessWidget {
  final String movieName;
  final String showType;
  final String censorRating;
  const MovieName(
      this.movieName,
      this.showType,
      this.censorRating, {
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            movieName,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          Text(
            showType,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          Text(
            censorRating,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
          )
        ],
      ),
    );
  }
}