import 'package:flutter/material.dart';

class GradientAqi extends StatelessWidget {
  const GradientAqi({super.key});

  final TextStyle textStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w800,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.green, Colors.yellow, Colors.orange, Colors.red, Colors.purple],
        ),
        borderRadius: BorderRadiusDirectional.horizontal(start: Radius.circular(25),end: Radius.circular(25))
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('50', style: textStyle),
            Text('100', style: textStyle),
            Text('150', style: textStyle),
            Text('200', style: textStyle),
            Text('250', style: textStyle),
            Text('350', style: textStyle),
          ],
        ),
      ),
    );
  }
}
