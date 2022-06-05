import 'package:flutter/material.dart';

Widget listTileWidget(String title, String count,) {
  return Container(
    child: Column(
      children: [
        ListTile(
          title: Text(title),
          trailing: Text(count.toString()),
        ),
        Container(
          height: 2,
          decoration: BoxDecoration(
              color: Colors.blueGrey, borderRadius: BorderRadius.circular(50)),
        ),
      ],
    ),
  );
}
