import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../calculations/quiz_maker.dart';
import '../shared/components/components.dart';
import '../shared/components/constants.dart';
import '../shared/styles/styles.dart';
import '../shared/utils/keyboard_utils.dart';
import '../shared/utils/shared_prefs.dart';
import 'operation_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late Timer _timer;
  late int _timerSeconds =
      Shared.ndigits * Shared.scoremultiDI * Shared.scoremultiOP * 5;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_timerSeconds > 0) {
        setState(() {
          _timerSeconds--;
        });
      } else {
        setState(() {
          timer.cancel();
        });

        if (Shared.score == null) {
          setState(() {
            Shared.score = 0;
          });
        }
        if (!isAnswerCorrect) {
          setState(() {
            Shared.score -= Shared.ndigits;
            saveVariableToSharedPreferences('userScore', Shared.score);
            getSavedValueFromSharedPreferences('userScore');
          });
        }

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return const QuizScreen();
        }));
        // Add any logic you want to execute when the timer reaches 0.
      }
    });
  }

  void stopTimer() {
    _timer.cancel();
  }

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
      startTimer();
    });
  }

  @override
  void dispose() {
    inputFocusNode.dispose();
    stopTimer();
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
      appBar: buildAppBar(context),
      body: Center(
        child: SingleChildScrollView(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.timer,
                        color: Styles.pinkColor,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '$_timerSeconds s',
                        style: const TextStyle(
                            fontSize: 15, color: Styles.pinkColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Styles.lightColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            problem,
                            style: const TextStyle(
                              fontFamily: 'Dekko',
                              color: Styles.whiteColor,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ConstrainedBox(
                constraints:BoxConstraints.expand(height: 110),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Styles.lightColor,
                    ),
                    child: Center(
                      child: TextFormField(
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
                            prefix: Visibility(
                                visible: isAnswerCorrect,
                                child: Icon(
                                  CupertinoIcons.checkmark_rectangle_fill,
                                  color: CupertinoColors.activeGreen,
                                )),
                            suffix: Visibility(
                                visible: isAnswerCorrect,
                                child: Icon(
                                  CupertinoIcons.checkmark_rectangle_fill,
                                  color: CupertinoColors.activeGreen,
                                )),
                            alignLabelWithHint: true,
                            hintText: 'Enter your answer',
                            hintStyle: TextStyle(
                              color: Styles.blueColor.withOpacity(0.5),
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                            border: InputBorder.none,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20),
                          ),
                          onChanged: (_) {
                            setState(() {
                              isAnswerCorrect = false;
                            });
                          },
                          onFieldSubmitted: (_) {
                            checkAnswer();
                            if (isAnswerCorrect) {
                              setState(() {
                                _timer.cancel();
                                Shared.score += 10 *
                                    (Shared.scoremultiDI * Shared.scoremultiOP);
                                saveVariableToSharedPreferences(
                                    'userScore', Shared.score);
                                getSavedValueFromSharedPreferences('userScore');
                                inputIndicate = Colors.green;
                              });
                            }
                          }),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SmallCustomButton(
                color: Styles.blueColor,
                buttonText: 'CHECK',
                onTap: () {
                  checkAnswer();
                  if (isAnswerCorrect) {
                    setState(() {
                      _timer.cancel();
                      Shared.score +=
                          10 * (Shared.scoremultiDI * Shared.scoremultiOP);
                      saveVariableToSharedPreferences('userScore', Shared.score);
                      getSavedValueFromSharedPreferences('userScore');
                      // inputIndicate = Colors.green;
                    });
                  }
                },
              ),
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
                    SmallCustomButton(
                      buttonText: 'HOME',
                      onTap: () {
                        KeyboardUtils.hideKeyboard();
                        saveVariableToSharedPreferences(
                            'userScore', Shared.score);
                        getSavedValueFromSharedPreferences('userScore');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return const OperationScreen();
                          }),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              const SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}
