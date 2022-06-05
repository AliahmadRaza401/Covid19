// import 'package:flutter/material.dart';

// class SearchPage extends StatelessWidget {
//   const SearchPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

import 'package:covid19/Provider/homeProvider.dart';
import 'package:covid19/Utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Custom Widget/customListTile.dart';
import '../Custom Widget/customLoading.dart';
import '../Custom Widget/customWidget.dart';
import '../Utils/app_routes.dart';
import 'country_detail.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController searchController = TextEditingController();
  List filterData = [];
  @override
  Widget build(BuildContext context) {
    bool loading = Provider.of<HomeProvider>(context).loading;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  // color: Colors.amber,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: TextField(
                    controller: searchController,
                    onChanged: ((value) {
                      setState(() {
                        filterData =
                            Provider.of<HomeProvider>(context, listen: false)
                                .countries
                                .where((filt) => filt.country
                                    .toString()
                                    .toUpperCase()
                                    .contains(searchController.text
                                        .toString()
                                        .toUpperCase()))
                                .toList();
                      });
                    }),
                    decoration: myinputDecoration(),
                  ),
                ),
                                searchController.text.isEmpty

                    ? Container(
                                  height: AppSizes.dynamicHeight(context, 0.8),
                      child: Center(child: searchAimation() ))
                    : filterData.length == 0
                        ? Container(
                            height: AppSizes.dynamicHeight(context, 0.8),
                            child: Center(
                              child: noDataAimation(),
                            ),
                          )
                        : Container(
                          padding: EdgeInsets.only(top: 10,bottom: 10),
                            height: AppSizes.dynamicHeight(context, 0.8),
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount:
                                  filterData.isEmpty ? 0 : filterData.length,
                              itemBuilder: (BuildContext context, i) {
                                return InkWell(
                                  onTap: () {
                                    AppRoutes.push(
                                        context,
                                        CountryDetail(
                                          country:
                                              filterData[i].country.toString(),
                                          totalCase: filterData[i]
                                              .totalConfirmed
                                              .toString(),
                                          totalDeath: filterData[i]
                                              .totalDeaths
                                              .toString(),
                                          newCase: filterData[i]
                                              .newConfirmed
                                              .toString(),
                                          newDeath:
                                              filterData[i].newDeaths.toString(),
                                          newRecovered: filterData[i]
                                              .newRecovered
                                              .toString(),
                                          totalRecovered: filterData[i]
                                              .totalRecovered
                                              .toString(),
                                        ));
                                  },
                                  child: listTileWidget(
                                    filterData[i].country.toString(),
                                    filterData[i].totalConfirmed,
                                  ),
                                );
                              },
                            ),
                        ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
