import 'package:flutter/material.dart';

class HomeHeading extends StatelessWidget {
  const HomeHeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(12, 40, 12, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Assalamu'alaikum",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "Ahlan wa sahlan",
            style: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.w600,
              // letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
