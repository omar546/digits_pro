import 'package:flutter/material.dart';
import 'package:digits_app/calculations/quiz_maker.dart';
import '../shared/components/components.dart';
import '../shared/components/constants.dart';
import '../shared/styles/styles.dart';
import '../shared/utils/keyboard_utils.dart';
import 'operation_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Color inputIndicate = Styles.blueColor;
  TextEditingController inputController = TextEditingController();
  bool isAnswerCorrect = false;
  QuizMaker quiz = QuizMaker(Shared.ndigits, Shared.op);
  late String problem;
  late int result;
  late FocusNode inputFocusNode;

  void hideKeyboardOnHomeTap() {
    KeyboardUtils.hideKeyboard();
  }

  @override
  void initState() {
    super.initState();
    inputFocusNode = FocusNode();
    generateProblem();

    // Delay the focus request until after the widget is fully built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(inputFocusNode);
    });
  }

  @override
  void dispose() {
    inputFocusNode.dispose();
    super.dispose();
  }

  void generateProblem() {
    setState(() {
      problem = quiz.problem;
      result = quiz.result;
      isAnswerCorrect = false;
      inputController.text = '';
    });
  }

  void checkAnswer() {
    String input = inputController.text;
    setState(() {
      isAnswerCorrect = input == quiz.result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.main,
      appBar: buildAppBar(context, Shared.score),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text(
                  'SOLVE',
                  style: TextStyle(
                    fontFamily: 'impact',
                    color: Styles.whiteColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Styles.lightColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        problem,
                        style: const TextStyle(
                          fontFamily: 'Dekko',
                          color: Styles.whiteColor,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Styles.lightColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    style: const TextStyle(
                      color: Styles.blueColor,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                      textAlign: TextAlign.center,
                    controller: inputController,
                    keyboardType: TextInputType.number,
                    focusNode: inputFocusNode,
                    decoration: InputDecoration(

                      alignLabelWithHint: true,
                      hintText: 'Enter your answer',
                      hintStyle: TextStyle(
                        color: Styles.blueColor.withOpacity(0.5),
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    onChanged: (_) {
                      setState(() {
                        isAnswerCorrect = false;
                      });
                    },
                    onFieldSubmitted: (_){
                        checkAnswer();
                    if (isAnswerCorrect) {
                      setState(() {
                        Shared.score += 1 * (Shared.scoremultiDI * Shared.scoremultiOP);
                        inputIndicate = Colors.green;});}}),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SmallCustomButton(
              color: inputIndicate,
              buttonText: 'CHECK',
              onTap: () {
                checkAnswer();
                if (isAnswerCorrect) {
                  setState(() {
                    Shared.score += 1 * (Shared.scoremultiDI * Shared.scoremultiOP);
                    inputIndicate = Colors.green;
                  });
                }
              },
            ),
            const SizedBox(height: 30),
            if (!isAnswerCorrect) const SizedBox(height: 50),
            if (isAnswerCorrect)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmallCustomButton(
                    buttonText: 'NEXT',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return const QuizScreen();
                        }),
                      );
                    },
                  ),
                  const SizedBox(width: 30),
                  SmallCustomButton(
                    buttonText: 'HOME',
                    onTap: () {
                      KeyboardUtils.hideKeyboard();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return const OperationScreen();
                        }),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
