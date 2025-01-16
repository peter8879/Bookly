import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String error;
  const CustomErrorWidget({super.key,required this.error});

  @override
  Widget build(BuildContext context) {
    return Text(
      error,
      style: Styles.textStyle18,
      textAlign: TextAlign.center,
    );
  }
}
