import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_demo/common/widgtes/custom_card_view.dart';
import 'package:weatherapp_demo/const/app_textstyle.dart';
import 'package:weatherapp_demo/const/color.dart';
import 'package:weatherapp_demo/const/extension.dart';
import 'package:weatherapp_demo/const/image.dart';
import 'package:weatherapp_demo/model/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel? weather;
  WeatherCard({super.key, required this.weather});

  final DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTextfiledView(),
          Text(
            "${weather?.current.tempC.toInt()}°",
            style: AppTextStyle.bold16TextStyle.copyWith(fontSize: 120),
          ),
          Column(
            children: [
              Text(
                weather?.current.condition.text ?? '',
                style: AppTextStyle.bold16TextStyle,
              ),
              Text(
                DateFormat.yMMMMd().format(now),
                style: AppTextStyle.mediumTextStyle,
              ),
              20.vs,
              _buildBottomCardList(),
            ],
          ),
        ],
      ),
    );
  }

  // TextFiled View
  Widget _buildTextfiledView() {
    return Column(
      children: [
        20.vs,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              ConstImage.icLocationIcon,
              colorFilter: const ColorFilter.mode(
                  ConstColor.whiteColor, BlendMode.srcIn),
              height: 20,
            ),
            5.hs,
            Text(
              weather?.location.name ?? '',
              style: AppTextStyle.semiBold24TextStyle,
            ),
          ],
        ),
      ],
    );
  }

  // Bottom Card View
  Widget _buildBottomCardList() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomCardView(
              image: ConstImage.icWindIcon,
              title: 'Wind',
              value: "${weather?.current.windKph} km/h",
            ),
            8.hs,
            CustomCardView(
              image: ConstImage.icHumidityIcon,
              title: 'Humidity',
              value: "${weather?.current.humidity}%",
            ),
          ],
        ),
        10.vs,
        Row(
          children: [
            CustomCardView(
              image: ConstImage.icPressureIcon,
              title: 'Pressure',
              value: "${weather?.current.pressureMb} mb",
            ),
            8.hs,
            CustomCardView(
              image: ConstImage.icHeatIcon,
              title: 'Heat',
              value: "${weather?.current.heatindexC} °C",
            ),
          ],
        )
      ],
    );
  }
}
