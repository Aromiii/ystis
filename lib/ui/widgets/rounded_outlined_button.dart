import 'package:flutter/material.dart';
import 'package:tinder_app_flutter/util/constants.dart';

class RoundedOutlinedButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  RoundedOutlinedButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: OutlinedButton(
          child: Text(text, style: Theme.of(context).textTheme.button),
          onPressed: onPressed,
        ));
  }
}
