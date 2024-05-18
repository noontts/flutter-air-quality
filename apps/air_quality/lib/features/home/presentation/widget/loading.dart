import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingFullScreen extends StatelessWidget {
  const LoadingFullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset("assets/lotties/loading.json"),
    );
  }
}
