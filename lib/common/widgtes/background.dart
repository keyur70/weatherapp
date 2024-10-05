import 'package:flutter/material.dart';

class CommanBackgroundColor extends StatelessWidget {
  final Widget child;
  const CommanBackgroundColor({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF233A4E),
            Color(0xFF9c6db0),
          ],
        ),
      ),
      child: child,
    );
  }
}
