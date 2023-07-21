import 'package:shared_preferences/shared_preferences.dart';

class Shared {

  static int score=0;

  Future<void> getValueFromSharedPreferences(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    score = prefs.getInt('userScore') ?? 0;
  }


  static String op = '';
  static late int ndigits;
  static int scoremultiOP = 0;
  static int scoremultiDI = 0;
}