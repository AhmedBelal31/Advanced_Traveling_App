import 'package:flutter/material.dart';
import 'package:flutter_master_class_travel_app/shared/theme/Colors.dart';

Widget defaultText({
  required String text,
  Color color = AppColor.textColor2,
  double size = 16.0,
}) =>
    Text(
      text,
      style: TextStyle(color: color, fontSize: size, height: 1.3),
    );

Widget defaultLargeText({
  required String text,
  Color color = Colors.black,
  double size = 30.0,
  FontWeight fontWeight = FontWeight.bold,
 }) =>
    Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,

      ),
    );

Widget responsiveButton({
  double? width,
  bool isResponsive =true,
  required Function() function,
}) =>
    InkWell(
      onTap: function,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColor.mainColor),
        child:isResponsive ==true ? Image.asset(
          'assets/images/button-one.png',
        ) :Row(
          children: [
            SizedBox(width: 20,),
            defaultText(text: 'Book Trip Now ' ,color: Colors.white),
            Spacer(),
            Image.asset(
              'assets/images/button-one.png',
            )
          ],
        ),
      ),
    );
