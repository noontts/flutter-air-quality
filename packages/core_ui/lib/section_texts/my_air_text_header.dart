import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyAirTextHeader extends StatelessWidget {
  const MyAirTextHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
