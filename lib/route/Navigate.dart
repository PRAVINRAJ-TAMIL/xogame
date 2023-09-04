import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'package:xo/screen/game.dart';
import 'package:xo/screen/home_ui.dart';
final TextEditingController players1 = TextEditingController();
final TextEditingController players2 = TextEditingController();
class RoutingXo {
  static String player ="/player";
  static String game ="/game";

final getpages =[
  GetPage(name: player, page:(() => const Home_UI ())),
  GetPage(name: game, page:(() =>  Game(player1: players1.text, player2: players2.text))),


];
}
