import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color buttonColor;
  final Color textColor;
  final String text;
  final BorderRadius? borderRadius;
  final void Function()? onPressed;



  const CustomButton({
    this.onPressed,
    Key? key,
    required this.buttonColor,
    required this.textColor,
     this.borderRadius,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: buttonColor,
          shape:  RoundedRectangleBorder(
            borderRadius: borderRadius?? BorderRadius.circular(12.0),
          )
        ),
        child:  Text(
            text,
          style: Styles.textStyle16.copyWith(
            color: textColor,
            fontWeight: FontWeight.w900,
            fontSize: 18
          ),
        ),
        onPressed: onPressed
      ),
    );
  }
}
