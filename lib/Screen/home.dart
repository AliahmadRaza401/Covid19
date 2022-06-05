import 'package:covid19/Provider/homeProvider.dart';
import 'package:covid19/Utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Custom Widget/customWidget.dart';

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

  getData() async {
    await _homeProvider.fetchAllCounty(context);
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
                // color: Colors.amber,
                child: prov.loading
                    ? CircularProgressIndicator()
                    : ListView.builder(
                        itemCount: prov.countries.length == null ||
                                prov.countries.isEmpty
                            ? 0
                            : prov.countries.length,
                        itemBuilder: (context, i) {
                          return Container(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                      prov.countries[i].country.toString()),
                                  trailing: Text(prov
                                      .countries[i].totalConfirmed
                                      .toString()),
                                ),
                                Container(
                                  height: 2,
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      }))),
    );
  }
}
