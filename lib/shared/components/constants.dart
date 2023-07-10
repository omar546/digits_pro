class Shared {
  static int maxScore = 10000000000; // Maximum score value
  static int _score = 0;

  static int get score => _score;

  static set score(int value) {
    _score = value;
    if (_score >= maxScore) {
      _score = maxScore;
    }
  }

  static String op = '';
  static late int ndigits;
  static int scoremultiOP = 0;
  static int scoremultiDI = 0;
}