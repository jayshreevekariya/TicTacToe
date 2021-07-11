import 'package:flutter/material.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({
    Key key,
    @required this.oplayer,
    @required this.draw,
    @required this.xplayer,
  }) : super(key: key);

  final int oplayer;
  final int draw;
  final int xplayer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          scoreItem(title: "Player O", score: oplayer),
          scoreItem(title: "Draw", score: draw),
          scoreItem(title: "Player X", score: xplayer),
        ],
      ),
    );
  }

  Widget scoreItem({
    @required String title,
    @required int score,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Text(
          score.toString(),
          style: TextStyle(
              fontSize: 25,
              color: Color(0xffdeb887),
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
