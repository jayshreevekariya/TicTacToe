import 'package:flutter/material.dart';
import 'package:tictactoe/game_board.dart';
import 'package:tictactoe/primary_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:tictactoe/score_board.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> ticTacText = List.filled(9, "", growable: true);
  bool playerTurn = true;
  int oplayer = 0;
  int xplayer = 0;
  String winner = "";
  int draw = 0;
  String drawStatus = "";
  int filledbox = 0;
  String player = "";
  String oh = "O";
  String ex = "X";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5f9ea0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                DottedBorder(
                  strokeWidth: 2,
                  color: Color(0xffdeb887),
                  child: Container(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "TIC TAC TOE",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ScoreBoard(oplayer: oplayer, draw: draw, xplayer: xplayer),
                SizedBox(height: 15),
                GameBoard(
                  onTap: (int index) => tapped(index),
                  ticTacText: ticTacText,
                  oh: oh,
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PrimaryButton(
                        title: "Replay",
                        onPressed: replayGame,
                      ),
                      PrimaryButton(
                        title: "Restart",
                        onPressed: restartGame,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    player,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  winner.isNotEmpty ? winner : drawStatus,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void replayGame() {
    setState(() {
      for (int i = 0; i < ticTacText.length; i++) {
        ticTacText[i] = "";
      }
      playerTurn = true;
      winner = "";
      drawStatus = "";
    });
  }

  void restartGame() {
    setState(() {
      for (int i = 0; i < ticTacText.length; i++) {
        ticTacText[i] = "";
      }
      playerTurn = true;
      winner = "";
      oplayer = 0;
      xplayer = 0;
      draw = 0;
      drawStatus = "";
    });
  }

  void tapped(int index) {
    if (winner.isEmpty) {
      if (ticTacText[index] == "") {
        setState(() {
          if (playerTurn && ticTacText[index] == "") {
            ticTacText[index] = oh;
          } else if (!playerTurn && ticTacText[index] == "") {
            ticTacText[index] = ex;
          }
          playerTurn = !playerTurn;
          checkWinner();
          playersTurn();
        });
      }
    }
  }

  void checkWinner() {
//first Row
    if (ticTacText[0] == ticTacText[1] &&
        ticTacText[0] == ticTacText[2] &&
        ticTacText[0] != "") {
      playerStatus(ticTacText[0]);
    }
//second Row
    else if (ticTacText[3] == ticTacText[4] &&
        ticTacText[3] == ticTacText[5] &&
        ticTacText[3] != "") {
      playerStatus(ticTacText[3]);
    }
//third Row
    else if (ticTacText[6] == ticTacText[7] &&
        ticTacText[6] == ticTacText[8] &&
        ticTacText[6] != "") {
      playerStatus(ticTacText[6]);
    }
//first column
   else if (ticTacText[0] == ticTacText[3] &&
        ticTacText[0] == ticTacText[6] &&
        ticTacText[0] != "") {
      playerStatus(ticTacText[0]);
    }
//second column
    else if (ticTacText[1] == ticTacText[4] &&
        ticTacText[1] == ticTacText[7] &&
        ticTacText[1] != "") {
      playerStatus(ticTacText[1]);
    }
//third column
   else  if (ticTacText[2] == ticTacText[5] &&
        ticTacText[2] == ticTacText[8] &&
        ticTacText[2] != "") {
      playerStatus(ticTacText[2]);
    }
//left Diagonal
    else if (ticTacText[0] == ticTacText[4] &&
        ticTacText[0] == ticTacText[8] &&
        ticTacText[0] != "") {
      playerStatus(ticTacText[0]);
    }
//right Diagonal
   else  if (ticTacText[2] == ticTacText[4] &&
        ticTacText[2] == ticTacText[6] &&
        ticTacText[2] != "") {
      playerStatus(ticTacText[2]);
    } else  {
      drawGame();
    }
  }

  void playerStatus(String win) {
    winner = "Winner is " + win;
    if (win == oh) {
      oplayer++;
    } else if (win == ex) {
      xplayer++;
    }
  }

  void playersTurn() {
    player = playerTurn ? "Player O" : "Player X";
    if (winner.isNotEmpty || drawStatus.isNotEmpty) {
      player = "";
    }
  }

  void drawGame() {
    int fillCount = 0;

    for (int i = 0; i < ticTacText.length; i++) {
      if (ticTacText[i].isEmpty) {
        break;
      } else {
        fillCount++;
      }
      if (fillCount == ticTacText.length) {
        drawStatus = "Game Draw";
        draw++;
      }
    }
  }
}
