import 'package:covid19/Custom%20Widget/customWidget.dart';
import 'package:covid19/Utils/app_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryDetail extends StatelessWidget {
  String? country;
  String? totalCase;
  String? totalDeath;
  String? newCase;
  String? newDeath;
  String? newRecovered;
  String? totalRecovered;

  CountryDetail({
    Key? key,
    this.country,
    this.totalCase,
    this.totalDeath,
    this.newCase,
    this.newDeath,
    this.newRecovered,
    this.totalRecovered,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          // width: AppSizes.dynamicWidth(context, 1),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: const Color.fromARGB(255, 9, 185, 141),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: AppSizes.dynamicHeight(context, 0.01),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 30,
                              )),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: AppSizes.dynamicHeight(context, 0.07),
                            ),
                            text(context, country,
                                AppSizes.dynamicWidth(context, 0.07),
                                color: Colors.white),
                            text(context, 'Corona State Overview',
                                AppSizes.dynamicWidth(context, 0.03),
                                color: Colors.white),
                          ],
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 4,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Container(
                      margin: EdgeInsets.only(
                          top: AppSizes.dynamicWidth(
                            context,
                            0.06,
                          ),
                          left: AppSizes.dynamicWidth(
                            context,
                            0.03,
                          ),
                          right: AppSizes.dynamicWidth(
                            context,
                            0.03,
                          )),
                      child: SizedBox(
                        height: AppSizes.dynamicHeight(context, 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      text(context, 'TOTAL CASES',
                                          AppSizes.dynamicWidth(context, 0.04)),
                                      text(context, totalCase.toString(),
                                          AppSizes.dynamicWidth(context, 0.04)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: AppSizes.dynamicHeight(context, 0.02),
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      text(context, 'NEW CASES',
                                          AppSizes.dynamicWidth(context, 0.04)),
                                      text(context, newCase.toString(),
                                          AppSizes.dynamicWidth(context, 0.04)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: AppSizes.dynamicHeight(context, 0.02),
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      text(context, 'NEW RECOVERED',
                                          AppSizes.dynamicWidth(context, 0.04)),
                                      text(context, newRecovered.toString(),
                                          AppSizes.dynamicWidth(context, 0.04)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      text(context, 'TOTAL DEATH',
                                          AppSizes.dynamicWidth(context, 0.04)),
                                      text(context, totalDeath.toString(),
                                          AppSizes.dynamicWidth(context, 0.04)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: AppSizes.dynamicHeight(context, 0.02),
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      text(context, 'NEW DEATH',
                                          AppSizes.dynamicWidth(context, 0.04)),
                                      text(context, newDeath.toString(),
                                          AppSizes.dynamicWidth(context, 0.04)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: AppSizes.dynamicHeight(context, 0.02),
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      text(context, 'TOTAL RECOVERED',
                                          AppSizes.dynamicWidth(context, 0.04)),
                                      text(context, totalRecovered.toString(),
                                          AppSizes.dynamicWidth(context, 0.04)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
