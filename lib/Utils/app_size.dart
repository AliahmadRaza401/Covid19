import 'package:flutter/material.dart';

class AppSizes {
  static  dynamicWidth(BuildContext context, dynamic dynamicSize) {
    return MediaQuery.of(context).size.width * dynamicSize;
  }

 static dynamicHeight(BuildContext context, dynamic dynamicSize) {
    return MediaQuery.of(context).size.height * dynamicSize;
  }

 static widthBox(BuildContext context, dynamic dynamicSize) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * dynamicSize,
    );
  }

 static heightBox(BuildContext context, dynamic dynamicSize) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * dynamicSize,
    );
  }
}