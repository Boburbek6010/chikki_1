import 'package:flutter/material.dart';

class IntroOne extends StatelessWidget {
  final Image image;
  final String message;
  const IntroOne({Key? key, required this.image, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 253,
          width: 271,
          child: image,
        ),
        const SizedBox(height: 77),
        Text(message, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall,),
      ],
    );
  }
}
