import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xo/screen/game.dart';

// ignore: camel_case_types
class Home_UI extends StatefulWidget {
  const Home_UI({super.key});

  @override
  State<Home_UI> createState() => _Home_UIState();
}

// ignore: camel_case_types
class _Home_UIState extends State<Home_UI> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController players1 = TextEditingController();
  final TextEditingController players2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
         
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                Color.fromARGB(255, 150, 166, 194),
                Color.fromARGB(179, 225, 180, 180)
              ])),
          child: Form(
            key: _formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ShaderMask(
                  shaderCallback: (rect) => const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: <Color>[
                      Color.fromARGB(255, 246, 116, 116),
                      Color.fromARGB(228, 245, 168, 245)
                    ],
                    tileMode: TileMode.mirror,
                  ).createShader(rect),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Text(
                      "XO GAME",
                      
                      style: GoogleFonts.ultra(
                          color: Colors.white,
                          shadows: <Shadow>[
                            const Shadow(
                              offset: Offset(5.0, 5.0),
                              blurRadius: 2.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            const Shadow(
                              offset: Offset(-5.0, -5.0),
                              blurRadius: 2.0,
                              color: Color.fromARGB(225, 0, 0, 0),
                            ),
                          ],
                          // backgroundColor: Colors.black,
                          fontSize: 39,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                ShaderMask(
                  shaderCallback: (rect) => const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: <Color>[
                      Color.fromARGB(255, 200, 151, 151),
                      Color.fromARGB(255, 243, 207, 243)
                    ],
                    tileMode: TileMode.mirror,
                  ).createShader(rect),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Text(
                      "Enter Player Name",
                      // Rubik Iso
                      style: GoogleFonts.ultra(
                          color: Colors.white,
                          shadows: <Shadow>[
                            const Shadow(
                              offset: Offset(5.0, 5.0),
                              blurRadius: 12.0,
                              color: Color.fromARGB(195, 0, 0, 0),
                            ),
                            const Shadow(
                              offset: Offset(-5.0, -5.0),
                              blurRadius: 12.0,
                              color: Color.fromARGB(175, 0, 0, 0),
                            ),
                          ],
                          fontSize: 19,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100, right: 50),
                  child: TextFormField(
                      controller: players1,
                      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 255, 0, 0))),
                          hintText: "Player 1",
                          hintStyle:
                              TextStyle(color: Color.fromARGB(255, 9, 9, 9)),
                          icon: Icon(
                            Icons.account_circle_outlined,
                            color: Colors.blueGrey,
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Player Name 1";
                        }
                        return null;
                      }),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 100, right: 50),
                    child: TextFormField(
                        controller: players2,
                        style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 190, 45, 45))),
                            hintText: "Player 2",
                            hintStyle: TextStyle(color: Colors.black),
                            icon: Icon(
                              Icons.account_circle_outlined,
                              color: Colors.blueGrey,
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Player Name 2";
                          }
                          return null;
                        }),
                  ),
                ),
                const SizedBox(height: 30),
                InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Game(
                                  player1: players1.text, player2: players2.text),
                            ));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50,bottom: 300),
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(108, 169, 244, 255),
                              Color.fromARGB(150, 255, 137, 176)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text(
                          "Continue",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.kaushanScript(
                            color: const Color.fromARGB(255, 79, 76, 76),
                            shadows: <Shadow>[
                              const Shadow(
                                offset: Offset(5.0, 5.0),
                                blurRadius: 12.0,
                                color: Color.fromARGB(195, 0, 0, 0),
                              ),
                              const Shadow(
                                offset: Offset(-5.0, -5.0),
                                blurRadius: 12.0,
                                color: Color.fromARGB(175, 0, 0, 0),
                              ),
                            ],
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
