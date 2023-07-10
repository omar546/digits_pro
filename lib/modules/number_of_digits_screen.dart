import 'package:flutter/material.dart';

import '../shared/components/components.dart';
import '../shared/components/constants.dart';
import '../shared/styles/styles.dart';
import '../modules/quiz_screen.dart';

enum Difficulty { easy, mid, hard }

class NumberOfDigitsScreen extends StatefulWidget {
  const NumberOfDigitsScreen({Key? key}) : super(key: key);

  @override
  State<NumberOfDigitsScreen> createState() => _NumberOfDigitsScreenState();
}

class _NumberOfDigitsScreenState extends State<NumberOfDigitsScreen> {
  Color customButtonColor = Styles.blueColor;
  bool isCustomButtonTapped = false;
  Difficulty _selectedDifficulty = Difficulty.easy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.main,
      appBar: buildAppBar(context, Shared.score),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Slider(
                value: _selectedDifficulty.index.toDouble(),
                min: 0,
                max: 2,
                divisions: 2,
                activeColor:Styles.pinkColor ,
                inactiveColor: Styles.darkColor,
                onChanged: (double value) {
                  setState(() {
                    _selectedDifficulty = Difficulty.values[value.toInt()];
                  });
                },
                label: _selectedDifficulty.toString().split('.').last,
              ),
              if (_selectedDifficulty == Difficulty.easy)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                  Icon(Icons.star_rate_rounded,color: Styles.blueColor,size: 32,),
                    SizedBox(height: 30),
                ],),

                if (_selectedDifficulty == Difficulty.easy)
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        buttonText: '?${Shared.op}?',
                        color: isCustomButtonTapped && Shared.ndigits == 1 ? customButtonColor : null,
                        onTap: () {
                          setState(() {
                            Shared.scoremultiDI = 1;
                            Shared.ndigits = 1;
                            isCustomButtonTapped = true;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        buttonText: '??${Shared.op}??',
                        color: isCustomButtonTapped && Shared.ndigits == 2 ? customButtonColor : null,
                        onTap: () {
                          setState(() {
                            Shared.scoremultiDI = 2;
                            Shared.ndigits = 2;
                            isCustomButtonTapped = true;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              if (_selectedDifficulty == Difficulty.mid)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.star_rate_rounded,color: Styles.blueColor,size: 32,),
                    Icon(Icons.star_rate_rounded,color: Styles.blueColor,size: 32,),
                    SizedBox(height: 30),
                  ],),

              if (_selectedDifficulty == Difficulty.mid)
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        buttonText: '???${Shared.op}???',
                        color: isCustomButtonTapped && Shared.ndigits == 3 ? customButtonColor : null,
                        onTap: () {
                          setState(() {
                            Shared.scoremultiDI = 3;
                            Shared.ndigits = 3;
                            isCustomButtonTapped = true;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        buttonText: '????${Shared.op}????',
                        color: isCustomButtonTapped && Shared.ndigits == 4 ? customButtonColor : null,
                        onTap: () {
                          setState(() {
                            Shared.scoremultiDI = 4;
                            Shared.ndigits = 4;
                            isCustomButtonTapped = true;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              if (_selectedDifficulty == Difficulty.hard)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.star_rate_rounded,color: Styles.blueColor,size: 32,),
                    Icon(Icons.star_rate_rounded,color: Styles.blueColor,size: 32,),
                    Icon(Icons.star_rate_rounded,color: Styles.blueColor,size: 32,),
                    SizedBox(height: 30),
                  ],),

              if (_selectedDifficulty == Difficulty.hard)
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        buttonText: '?????${Shared.op}?????',
                        color: isCustomButtonTapped && Shared.ndigits == 5 ? customButtonColor : null,
                        onTap: () {
                          setState(() {
                            Shared.scoremultiDI = 5;
                            Shared.ndigits = 5;
                            isCustomButtonTapped = true;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        buttonText: '??????${Shared.op}??????',
                        color: isCustomButtonTapped && Shared.ndigits == 6 ? customButtonColor : null,
                        onTap: () {
                          setState(() {
                            Shared.scoremultiDI = 6;
                            Shared.ndigits = 6;
                            isCustomButtonTapped = true;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 30),
              if (!isCustomButtonTapped)
                const SizedBox(height: 50,),

                if (isCustomButtonTapped)
                SmallCustomButton(
                  buttonText: 'NEXT',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return const QuizScreen();
                      }),
                    );
                  },
                ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
