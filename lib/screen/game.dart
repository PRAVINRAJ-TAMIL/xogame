import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xo/screen/home_ui.dart';

// ignore: must_be_immutable
class Game extends StatefulWidget {
  String player1;
  String player2;
  Game({super.key, required this.player1, required this.player2});

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 116, 119, 142),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            SizedBox(
              height: 120,
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("PLAYER NAME",
                          style: GoogleFonts.ultra(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(
                        width: 10,
                      ),
                      ShaderMask(
                        shaderCallback: (rect) => const LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: <Color>[
                            Color.fromARGB(227, 204, 255, 0),
                            Color.fromARGB(255, 252, 2, 206),
                            Color.fromARGB(227, 204, 255, 0)
                          ],
                          tileMode: TileMode.mirror,
                        ).createShader(rect),
                        child: Text(
                          _curntPlayer == "X"
                              ? "${widget.player1}($_curntPlayer)"
                              : "${widget.player2}($_curntPlayer)",
                          style: GoogleFonts.ultra(
                              color: _curntPlayer == "X"
                                  ? Colors.white
                                  : Colors.white,

                              // color:
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 350,
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) {
                    int row = index ~/ 3;
                    int colu = index % 3;
                    return GestureDetector(
                      onTap: () => move(row, colu),
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 147, 165, 152),
                        ),
                        child: Center(
                          child: Text(
                            _xoBoard[row][colu],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 90,
                                fontWeight: FontWeight.w600,
                                color: _xoBoard[row][colu] == "X"
                                    ? const Color.fromARGB(255, 109, 5, 40)
                                    : const Color.fromARGB(255, 0, 255, 42)),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    // color: Color.fromARGB(255, 176, 190, 177),
                  ),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 13, 170, 76)),
                      onPressed: reset,
                      child: Text("Reset",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.ultra(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500))),
                ),
                Container(
                  height: 50,
                  width: 190,
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 222, 78, 68)),
                      onPressed: () {
                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home_UI()));
                        widget.player1 = "";
                        widget.player2 = "";
                      },
                      child: Text("Restart game",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.ultra(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500))),
                ),
              ],
            )
          ],
        ),
      ),
    ));
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
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(_win == "X"
                  ? "${widget.player1}Won"
                  : _win == "O"
                      ? "${widget.player2}Won"
                      : "Won"),
              content: const Text('Congratulation!'),
              actions: [
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Retry'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Get.to(RoutingXo.game);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home_UI(),
                            ));
                      },
                      child: const Text('Close'),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      }
    });
  }
}
