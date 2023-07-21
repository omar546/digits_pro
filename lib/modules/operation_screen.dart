import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../shared/components/components.dart';
import '../shared/components/constants.dart';
import '../shared/styles/styles.dart';
import 'number_of_digits_screen.dart';
import '../shared/utils/keyboard_utils.dart';

class OperationScreen extends StatefulWidget {
  const OperationScreen({Key? key}) : super(key: key);


  @override
  State<OperationScreen> createState() => _OperationScreenState();
}

class _OperationScreenState extends State<OperationScreen> {
  bool isCustomButtonTapped = false;
  bool isFirstLoad = true;

  @override
  void initState() {
    super.initState();

    // Automatically tap the button only once when the screen loads
    if (isFirstLoad) {
      tapButtonAutomatically();
      isFirstLoad = false;
    }
  }

  void tapButtonAutomatically() async {
    setState(() {
      isCustomButtonTapped = true;
    });

    // Wait for a short duration (e.g., 2 seconds)
    await Future.delayed(Duration(milliseconds: 1));

    setState(() {
      isCustomButtonTapped = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    void hideKeyboardOnHomeTap() {
      KeyboardUtils.hideKeyboard();
    }
     hideKeyboardOnHomeTap();
    return Scaffold(
      backgroundColor: Styles.main,
      appBar:buildAppBar(context),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 25,),
              CustomButton(
                buttonText: 'ADD',
                icon: Icons.add,
                onTap: () {
                  setState(() {
                    Shared.scoremultiOP=1;
                    Shared.op = '+';
                    isCustomButtonTapped = true;
                  });
                },
                color: isCustomButtonTapped && Shared.op == '+' ? Styles.blueColor : null,
                textColor: isCustomButtonTapped && Shared.op == '+' ? Styles.darkColor : null,
              ),
              const SizedBox(height: 15,),
              CustomButton(
                buttonText: 'SUBTRACT',
                icon: Icons.remove,
                onTap: () {
                  setState(() {
                    Shared.scoremultiOP=1;

                    Shared.op = '-';
                    isCustomButtonTapped = true;
                  });
                },
                color: isCustomButtonTapped && Shared.op == '-' ? Styles.blueColor : null,
                textColor: isCustomButtonTapped && Shared.op == '-' ? Styles.darkColor : null,

              ),
              const SizedBox(height: 15,),
              CustomButton(
                buttonText: 'MULTIPLY',
                icon: Icons.close,
                onTap: () {
                  setState(() {
                    Shared.scoremultiOP=2;
                    Shared.op = '*';
                    isCustomButtonTapped = true;
                  });
                },
                color: isCustomButtonTapped && Shared.op == '*' ? Styles.blueColor : null,
                textColor: isCustomButtonTapped && Shared.op == '*' ? Styles.darkColor : null,

              ),
              const SizedBox(height: 15,),
              CustomButton(
                buttonText: 'DIVIDE',
                icon: CupertinoIcons.divide,
                onTap: () {
                  setState(() {
                    Shared.scoremultiOP=2;
                    Shared.op = '/';
                    isCustomButtonTapped = true;
                  });
                },
                color: isCustomButtonTapped && Shared.op == '/' ? Styles.blueColor : null,
                textColor: isCustomButtonTapped && Shared.op == '/' ? Styles.darkColor : null,

              ),
              const SizedBox(height: 30,),
              if (!isCustomButtonTapped)
                const SizedBox(height: 50,),

              if (isCustomButtonTapped)
                SmallCustomButton(
                  buttonText: 'NEXT',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return const NumberOfDigitsScreen();
                      }),
                    );
                  },
                ),
              const SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}