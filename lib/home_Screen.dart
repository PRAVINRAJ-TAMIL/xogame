import 'package:flutter/material.dart';
import 'package:xo/home_ui.dart';


class Game extends StatefulWidget {
  String player1;
  String player2;
  Game({required this.player1, required this.player2});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  late List<List<String>> _xoBoard;
  late String _curntPlayer;
  late bool _finish;
  late String _win;

  @override
  void initState() {
    super.initState();
    _curntPlayer = "X";
    _win = "";
    _xoBoard = List.generate(3, (_) => List.generate(3, (_) => ""));
    _finish = false;
  }

// Gamereset
  void reset() {
    setState(() {
      _curntPlayer = "X";
      _win = "";
      _finish = false;
      _xoBoard = List.generate(3, (_) => List.generate(3, (_) => ""));
    });
  }

  void move(int row, int colu) {
    if (_xoBoard[row][colu] != "" || _finish) {
      return;
    }
    setState(() {
      _xoBoard[row][colu] = _curntPlayer;

      if (_xoBoard[0][colu] == _curntPlayer &&
          _xoBoard[1][colu] == _curntPlayer &&
          _xoBoard[2][colu] == _curntPlayer) {
        _win = _curntPlayer;
        _finish = true;
      } else if (_xoBoard[0][colu] == _curntPlayer &&
          _xoBoard[1][colu] == _curntPlayer &&
          _xoBoard[2][colu] == _curntPlayer) {
        _win = _curntPlayer;
        _finish = true;
      } else if (_xoBoard[0][0] == _curntPlayer &&
          _xoBoard[1][1] == _curntPlayer &&
          _xoBoard[2][2] == _curntPlayer) {
        _win = _curntPlayer;
        _finish = true;
      } else if (_xoBoard[0][2] == _curntPlayer &&
          _xoBoard[1][1] == _curntPlayer &&
          _xoBoard[2][0] == _curntPlayer) {
        _win = _curntPlayer;
        _finish = true;
      }
      //
      //
      _curntPlayer = _curntPlayer == "X" ? "O" : "X";

      // check tie
      if (!_xoBoard.any((row) => row.any((cell) => cell == ""))) {
        _finish = true;
        _win = "Win";
      }
      if (_win != "") {
        // AwesomeDialog(context: context,),
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(_win == "X"
                  ? widget.player1 + "Won"
                  : _win == "O"
                      ? widget.player2 + "Won"
                      : "Won"),
              content: Text('This is the content of the dialog box.'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 116, 119, 142),
      body: Column(
        children: [
          SizedBox(height: 80),
          SizedBox(
            
            height: 120,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("PLAYER"),
                    
                    Text(
                      _curntPlayer == "X"
                          ? widget.player1 + "($_curntPlayer)"
                          : widget.player2 + "($_curntPlayer)",
                      style: TextStyle(
                          color: _curntPlayer == "X"
                              ? Colors.orange
                              : Colors.lightGreen),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 350,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                   
                    ),
                itemBuilder: (context, index) {
                  int row = index ~/ 3;
                  int colu = index % 3;
                  return GestureDetector(
                    onTap: () => move(row, colu),
                    child: Container(
                      margin: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 187, 200, 206),
                      ),
                      child: Center(
                        child: Text(
                          _xoBoard[row][colu],
                          style: TextStyle(
                            
                              fontSize: 120,
                              fontWeight: FontWeight.w600,
                              color: _xoBoard[row][colu] == "X"
                                  ? Colors.pink
                                  : Color.fromARGB(255, 82, 255, 111)),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: reset,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                    child: Text("Reset")),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Home_UI()));
                  widget.player1 = "";
                                      widget.player2 = "";

                },
                child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 145, 9, 152),
                    ),
                    child: Text("Reset game")),
              )
            ],
          )
        ],
      ),
    ));
  }
}
