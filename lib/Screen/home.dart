import 'dart:developer';

import 'package:covid19/Custom%20Widget/customLoading.dart';
import 'package:covid19/Provider/homeProvider.dart';
import 'package:covid19/Utils/app_routes.dart';
import 'package:covid19/Utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Custom Widget/customListTile.dart';
import '../Custom Widget/customWidget.dart';
import 'country_detail.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeProvider _homeProvider;

  @override
  void initState() {
    super.initState();
    _homeProvider = Provider.of<HomeProvider>(context, listen: false);
    getData();
  }

  var responce;
  getData() async {
    responce = await _homeProvider.fetchAllCounty(context);
    print('responce: ${responce}');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Consumer<HomeProvider>(builder: ((context, prov, child) {
        return Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
            bottom: 10,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                text(
                  context,
                  "Countries",
                  AppSizes.dynamicWidth(context, 0.06),
                ),
                Container(
                  height: AppSizes.dynamicHeight(context, 0.8),
                  child: responce == false
                      ? Center(
                          child: Text(
                              "Some things wrong try again later \n check your internet connection"),
                        )
                      : prov.loading
                          ? Container(
                              height: AppSizes.dynamicHeight(context, 0.8),
                              alignment: Alignment.center,
                              child: Center(child: loadingTextAimation()))
                          : ListView.builder(
                              itemCount: prov.countries.length == null ||
                                      prov.countries.isEmpty
                                  ? 0
                                  : prov.countries.length,
                              itemBuilder: (context, i) {
                                return InkWell(
                                  onTap: () {
                                    AppRoutes.push(
                                        context,
                                        CountryDetail(
                                          country: prov.countries[i].country
                                              .toString(),
                                          totalCase: prov
                                              .countries[i].totalConfirmed
                                              .toString(),
                                          totalDeath: prov
                                              .countries[i].totalDeaths
                                              .toString(),
                                          newCase: prov
                                              .countries[i].newConfirmed
                                              .toString(),
                                          newDeath: prov.countries[i].newDeaths
                                              .toString(),
                                          newRecovered: prov
                                              .countries[i].newRecovered
                                              .toString(),
                                          totalRecovered: prov
                                              .countries[i].totalRecovered
                                              .toString(),
                                        ));
                                  },
                                  child: listTileWidget(
                                    prov.countries[i].country.toString(),
                                    prov.countries[i].totalConfirmed,
                                  ),
                                );
                              },
                            ),
                ),
              ],
            ),
          ),
        );
      }))),
    );
  }
}
