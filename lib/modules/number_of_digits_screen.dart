import 'package:flutter/material.dart';

import '../shared/components/components.dart';
import '../shared/components/constants.dart';
import '../shared/styles/styles.dart';
import '../modules/quiz_screen.dart';

enum Difficulty { easy, med, hard }

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
      appBar: buildAppBar(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 10.0,
                trackShape: const RoundedRectSliderTrackShape(),
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 14.0,
                  pressedElevation: 8.0,
                ),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 32.0),
                tickMarkShape: const RoundSliderTickMarkShape(),
                activeTickMarkColor: Colors.pinkAccent,
                valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                valueIndicatorColor: Colors.black,
                valueIndicatorTextStyle: const TextStyle(
                  color: Styles.darkColor,
                  fontSize: 20.0,
                ),
              ),
              child: Slider(
                value: _selectedDifficulty.index.toDouble(),
                min: 0,
                max: 2,
                divisions: 2,
                activeColor: Styles.pinkColor,
                inactiveColor: Styles.darkColor,
                onChanged: (double value) {
                  setState(() {
                    _selectedDifficulty = Difficulty.values[value.toInt()];
                  });
                },
                label: _selectedDifficulty.toString().split('.').last,
              ),
            ),
          ),
          if (_selectedDifficulty == Difficulty.easy)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.star_rate_rounded,
                  color: Styles.blueColor,
                  size: 32,
                ),
                SizedBox(height: 30),
              ],
            ),
          if (_selectedDifficulty == Difficulty.easy)
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    buttonText: '? ${Shared.op} ?',
                    color: isCustomButtonTapped && Shared.ndigits == 1
                        ? customButtonColor
                        : null,
                    textColor: isCustomButtonTapped && Shared.ndigits == 1
                        ? Styles.darkColor
                        : null,
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
                    buttonText: '?? ${Shared.op} ??',
                    color: isCustomButtonTapped && Shared.ndigits == 2
                        ? customButtonColor
                        : null,
                    textColor: isCustomButtonTapped && Shared.ndigits == 2
                        ? Styles.darkColor
                        : null,
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
          if (_selectedDifficulty == Difficulty.med)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.star_rate_rounded,
                  color: Styles.blueColor,
                  size: 32,
                ),
                Icon(
                  Icons.star_rate_rounded,
                  color: Styles.blueColor,
                  size: 32,
                ),
                SizedBox(height: 30),
              ],
            ),
          if (_selectedDifficulty == Difficulty.med)
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    buttonText: '??? ${Shared.op} ???',
                    color: isCustomButtonTapped && Shared.ndigits == 3
                        ? customButtonColor
                        : null,
                    textColor: isCustomButtonTapped && Shared.ndigits == 3
                        ? Styles.darkColor
                        : null,
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
                    buttonText: '???? ${Shared.op} ????',
                    color: isCustomButtonTapped && Shared.ndigits == 4
                        ? customButtonColor
                        : null,
                    textColor: isCustomButtonTapped && Shared.ndigits == 4
                        ? Styles.darkColor
                        : null,
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
                Icon(
                  Icons.star_rate_rounded,
                  color: Styles.blueColor,
                  size: 32,
                ),
                Icon(
                  Icons.star_rate_rounded,
                  color: Styles.blueColor,
                  size: 32,
                ),
                Icon(
                  Icons.star_rate_rounded,
                  color: Styles.blueColor,
                  size: 32,
                ),
                SizedBox(height: 30),
              ],
            ),
          if (_selectedDifficulty == Difficulty.hard)
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    buttonText: '????? ${Shared.op} ?????',
                    color: isCustomButtonTapped && Shared.ndigits == 5
                        ? customButtonColor
                        : null,
                    textColor: isCustomButtonTapped && Shared.ndigits == 5
                        ? Styles.darkColor
                        : null,
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
                    buttonText: '?????? ${Shared.op} ??????',
                    color: isCustomButtonTapped && Shared.ndigits == 6
                        ? customButtonColor
                        : null,
                    textColor: isCustomButtonTapped && Shared.ndigits == 6
                        ? Styles.darkColor
                        : null,
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
            const SizedBox(
              height: 66,
            ),

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
        ],
      ),
    );
  }
}
