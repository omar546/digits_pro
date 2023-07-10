import 'dart:math';

class QuizMaker {
  final int numberOfDigits;
  final String operator;
  late String problem;
  late int result;

  QuizMaker(this.numberOfDigits, this.operator) {
    generateProblem();
  }

  void generateProblem() {
    // Generate random numbers with the specified number of digits
    int num1 = Random().nextInt(pow(10, numberOfDigits).toInt());
    int num2 = Random().nextInt(pow(10, numberOfDigits).toInt());

    // Perform the operation based on the operator
    switch (operator) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        result = max(num1,num2) ~/ min(num1, num2); // Use integer division for whole number result
        break;
      default:
        throw ArgumentError('Invalid operator: $operator');
    }

    // Create the math problem string
    problem = '$num1 $operator $num2';
  }
}