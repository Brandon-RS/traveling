import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SlideHeader extends StatelessWidget {
  const SlideHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        ),
        RichText(
          text: TextSpan(
            text: 'View all',
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () => {},
          ),
        ),
      ],
    );
  }
}
