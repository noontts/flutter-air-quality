import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) { // ฝากไว้ก่อน
    return Container(
              width: MediaQuery.of(context).size.width,
              child: const Text(
                'Current Observation',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
            );
  }
}