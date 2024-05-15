import 'package:flutter/material.dart';

Color aqiToColor(int aqi){
  if (aqi >= 0 && aqi <= 50) {
    return Colors.green;  // Good
  } else if (aqi >= 51 && aqi <= 100) {
    return Colors.yellow;  // Moderate
  } else if (aqi >= 101 && aqi <= 150) {
    return Colors.orange;  // Unhealthy for Sensitive Groups
  } else if (aqi >= 151 && aqi <= 200) {
    return Colors.red;  // Unhealthy
  } else if (aqi >= 201 && aqi <= 300) {
    return Colors.purple;  // Very Unhealthy
  } else if (aqi >= 301) {
    return Colors.brown;  // Hazardous
  } else {
    return Colors.grey;  // Default case if the AQI number is not recognized
  }
}

LinearGradient getAqiGradient(int aqi) {
  if (aqi >= 0 && aqi <= 50) {
    return const LinearGradient(
      colors: [Colors.green, Colors.lightGreen],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  } else if (aqi >= 51 && aqi <= 100) {
    return const LinearGradient(
      colors: [Colors.yellow, Colors.amber],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  } else if (aqi >= 101 && aqi <= 150) {
    return const LinearGradient(
      colors: [Colors.orange, Colors.deepOrange],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  } else if (aqi >= 151 && aqi <= 200) {
    return const LinearGradient(
      colors: [Colors.red, Colors.redAccent],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  } else if (aqi >= 201 && aqi <= 300) {
    return const LinearGradient(
      colors: [Colors.purple, Colors.deepPurple],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  } else if (aqi >= 301) {
    return LinearGradient(
      colors: [Colors.brown, Colors.brown[800]!],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  } else {
    return const LinearGradient(
      colors: [Colors.grey, Colors.blueGrey],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}

LinearGradient getAqiGradientMainZone(int aqi) {
  if (aqi >= 0 && aqi <= 50) {
    return const LinearGradient(
      colors: [Color(0xFF47F5F5), Color(0xFFE7FFFF)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  } else if (aqi >= 51 && aqi <= 100) {
    return const LinearGradient(
      colors: [Color(0xFFFAD550), Color(0xFFFFFAEA)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  } else if (aqi >= 101 && aqi <= 150) {
    return const LinearGradient(
      colors: [Color(0xFFFB9855), Color(0xFFFFEEE2)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  } else if (aqi >= 151 && aqi <= 200) {
    return const LinearGradient(
      colors: [Color(0xFFFF6A6E), Color(0xFFFFDEDF)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  } else if (aqi >= 201 && aqi <= 300) {
    return const LinearGradient(
      colors: [Color(0xFFa97bbc), Color(0xFFebe2ef)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  } else if (aqi >= 301) {
    return const LinearGradient(
      colors: [Color(0xFF9b5974), Color(0xFFebd4dd)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  } else {
    return const LinearGradient(
      colors: [Color(0xFF47f5f5), Color(0xFFe7ffff)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }
}