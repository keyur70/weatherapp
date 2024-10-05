import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weatherapp_demo/const/app_textstyle.dart';
import 'package:weatherapp_demo/const/color.dart';
import 'package:weatherapp_demo/const/extension.dart';

class CustomCardView extends StatelessWidget {
  final String image;
  final String title;
  final String value;
  const CustomCardView(
      {super.key,
      required this.image,
      required this.title,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white.withOpacity(0.2),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              image,
              colorFilter: const ColorFilter.mode(
                  ConstColor.whiteColor, BlendMode.srcIn),
              height: 40,
            ),
            15.vs,
            Text(
              title,
              style: AppTextStyle.medium12TextStyle.copyWith(fontSize: 16),
            ),
            Text(
              value,
              style: AppTextStyle.bold16TextStyle.copyWith(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
