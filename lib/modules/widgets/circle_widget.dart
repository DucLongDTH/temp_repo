import 'package:flutter/material.dart';

class CircleWidget {
  static Widget buildCircleImageUrl(String urlImg, double size) {
    return CircleAvatar(
      radius: size / 2,
      backgroundImage: NetworkImage(urlImg),
    );
  }

  static Widget buildCircleColor(Color color, double size) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget buildCircularImageFromAsset(String assetName, {double radius = 50.0}) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(assetName),
        ),
      ),
    );
  }
}
