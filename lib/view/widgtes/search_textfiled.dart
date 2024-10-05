import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weatherapp_demo/bloc/weather_bloc/weather_bloc.dart';
import 'package:weatherapp_demo/bloc/weather_bloc/weather_event.dart';
import 'package:weatherapp_demo/const/app_textstyle.dart';
import 'package:weatherapp_demo/const/color.dart';
import 'package:weatherapp_demo/const/image.dart';

class SearchTextFiled extends StatelessWidget {
  SearchTextFiled({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
              controller: _controller,
              textInputAction: TextInputAction.search,
              cursorColor: ConstColor.whiteColor,
              style: AppTextStyle.mediumTextStyle,
              decoration: InputDecoration(
                filled: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none),
                fillColor: ConstColor.offWhiteColor,
                hintText: 'Search location....',
                hintStyle: AppTextStyle.mediumTextStyle
                    .copyWith(color: ConstColor.offWhiteColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
              onSubmitted: (value) {
                context
                    .read<WeatherBloc>()
                    .add(FetchWeatherEvent(value.trim()));
              }),
        ),
        IconButton(
          onPressed: () {
            context
                .read<WeatherBloc>()
                .add(FetchWeatherEvent(_controller.text.trim()));
          },
          icon: SvgPicture.asset(
            ConstImage.icSearchIcon,
            colorFilter:
                const ColorFilter.mode(ConstColor.whiteColor, BlendMode.srcIn),
          ),
        )
      ],
    );
  }
}
