import 'package:covid19/Utils/app_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

Widget loadingTextAimation() {
  return Lottie.asset("assets/9329-loading.json");
}

Widget noDataAimation() {
  return Lottie.asset(
    "assets/13659-no-data.json",
    height: 200,
  );
}

Widget searchAimation() {
  return Lottie.asset(
    "assets/98877-search.json",
    height: 200,
  );
}