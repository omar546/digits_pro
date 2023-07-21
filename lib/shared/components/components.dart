import 'package:flutter/material.dart';

import '../styles/styles.dart';
import '../utils/shared_prefs.dart';
import 'constants.dart';


AppBar buildAppBar(BuildContext context) {

  getSavedValueFromSharedPreferences('userScore');
  print('app bar loaded');
  return AppBar(

    automaticallyImplyLeading: false,
    backgroundColor: Styles.main,
    elevation: 0.0,
    titleSpacing: 20.0,
    leadingWidth: 0.0,
    title: Row(
      children: [
         Stack(
           children:[
            Text(
            'DIGITS',
            style: TextStyle(
              fontFamily: 'impact',
              fontSize: 25,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 2.0
                ..color = Styles.darkColor,
            ),
        ),
             const Text(
               'DIGITS',
               style: TextStyle(
                 fontFamily: 'impact',
                 fontSize: 25,
                 color: Styles.whiteColor,
               ),
             ),
         ]
         ),
        Stack(
            children:[
              Text(
                'pro',
                style: TextStyle(
                  fontFamily: 'Dekko',
                  fontSize: 25,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2.0
                    ..color = Styles.darkColor,
                ),
              ),
              const Text(
                'pro',
                style: TextStyle(
                  fontFamily: 'Dekko',
                  fontSize: 25,
                  color: Styles.whiteColor,
                ),
              ),
            ]
        ),

        const Expanded(child: SizedBox()),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
                children:[
                  Text(
                     '${Shared.score}',
                    style: TextStyle(
                      fontFamily: 'Dekko',
                      fontSize: 25,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2.0
                        ..color = Styles.darkColor,
                    ),
                  ),
                  Text(
                     '${Shared.score}',

                    style: const TextStyle(
                      fontFamily: 'Dekko',
                      fontSize: 25,
                      color: Styles.whiteColor,
                    ),
                  ),
                ]
            ),
          ],
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
                children:[
                  Text(
                    ': Score',
                    style: TextStyle(
                      fontFamily: 'impact',
                      fontSize: 20,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2.0
                        ..color = Styles.darkColor,
                    ),
                  ),
                  const Text(
                    ': Score',
                    style: TextStyle(
                      fontFamily: 'impact',
                      fontSize: 20,
                      color: Styles.whiteColor,
                    ),
                  ),
                ]
            ),
            const SizedBox(width: 20,),
          ],
        ),
      ],
    ),
  );
}


class CustomButton extends StatefulWidget {
  final String buttonText;
  final IconData? icon;
  final VoidCallback onTap;
  final Color? color;
  Color? textColor;// Add the color parameter

   CustomButton({super.key,
    required this.buttonText,
    this.icon,
    required this.onTap,
    this.color, this.textColor,// Add the color parameter to the constructor
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
        widget.onTap();
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.12,
        decoration: BoxDecoration(
          border: Border.all(
            color: Styles.darkColor, // Set the border color here
            width: 2.0,),
          borderRadius: BorderRadius.circular(30.0),
          color: isPressed
              ? Styles.lightestColor.withOpacity(0.5)
              : (widget.color ?? Styles.lightestColor), // Use the provided color if available, otherwise fallback to default color
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              widget.buttonText,
              style: TextStyle(
                color: isPressed
                    ? Styles.whiteColor.withOpacity(0.5)
                    : (widget.textColor ?? Styles.whiteColor),
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (widget.icon != null) const SizedBox(width: 10),
            if (widget.icon != null)
              CircleAvatar(
                backgroundColor: Styles.blueColor,
                radius: 16,
                child: Icon(
                  widget.icon,
                  size: 32,
                  color: Styles.darkColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}






class SmallCustomButton extends StatefulWidget {
  final String buttonText;
  final VoidCallback onTap;
  final Color? color;

  const SmallCustomButton({super.key,
    required this.buttonText,
    required this.onTap,
    this.color,
  });

  @override
  _SmallCustomButtonState createState() => _SmallCustomButtonState();
}

class _SmallCustomButtonState extends State<SmallCustomButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    Color buttonColor = widget.color ?? Styles.pinkColor;

    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
        widget.onTap();
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(
              color: Styles.darkColor, // Set the border color here
              width: 2.0,),
          borderRadius: BorderRadius.circular(30.0),
          color: isPressed ? buttonColor.withOpacity(0.5) : buttonColor,
        ),
        child: Center(
          child: Text(
            widget.buttonText,
            style: const TextStyle(
              color: Styles.darkColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}