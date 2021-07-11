import'package:flutter/material.dart';
class GameBoard extends StatelessWidget {
  const GameBoard({
    Key key,
    @required this.ticTacText,
    @required this.oh,
    this.onTap,
  }) : super(key: key);
  final Function(int index) onTap;

  final List<String> ticTacText;
  final String oh;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(20),
        itemCount: ticTacText.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: ()=>onTap(index),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: index % 3 == 1
                      ? BorderSide(
                          color: Color(0xffdeb887),
                          width: 3.0,
                        )
                      : BorderSide.none,
                  right: index % 3 == 1
                      ? BorderSide(
                          color: Color(0xffdeb887),
                          width: 3.0,
                        )
                      : BorderSide.none,
                  top: index == 3 || index == 4 || index == 5
                      ? BorderSide(
                          color: Color(0xffdeb887),
                          width: 3.0,
                        )
                      : BorderSide.none,
                  bottom: index == 3 || index == 4 || index == 5
                      ? BorderSide(
                          color: Color(0xffdeb887),
                          width: 3.0,
                        )
                      : BorderSide.none,
                ),
              ),
              child: Center(
                child: Text(
                  ticTacText[index],
                  style: TextStyle(
                    fontSize: ticTacText[index] == oh ? 80 : 75,
                    color: ticTacText[index] == oh
                        ? Color(0xff03858a)
                        : Colors.white,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
