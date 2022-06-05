import 'package:flutter/material.dart';

Widget text(context, text, size,
    {color = "", boldText = "", fontFamily = "", maxLines = 9}) {
  return Text(
    text,
    style: TextStyle(
      color: color == "" ? Colors.black : color,
      fontSize: size,
      fontWeight: boldText == "" ? FontWeight.normal : boldText,
      fontFamily: fontFamily == "" ? "Ubuntu" : fontFamily,
    ),
    maxLines: maxLines,
  );
}


myinputDecoration() {
  return InputDecoration(
    filled: true,
    fillColor: const Color(0xFFFFFFFF),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
    // / -- Text and Icon -- /
    hintText: "Search...",
    hintStyle: const TextStyle(
      fontSize: 18,
      color: Color(0xFFB3B1B1),
    ), // TextStyle
    suffixIcon: const Icon(
      Icons.search,
      size: 26,
      color: Colors.black54,
    ), // Icon
    // / -- Border Styling -- /
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 2.0,
        color: Color(0xFFD1D3D4),
      ), // BorderSide
    ), // OutlineInputBorder
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 2.0,
        color: Color(0xFFD1D3D4),
      ), // BorderSide
    ), // OutlineInputBorder
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 2.0,
        color: Color.fromARGB(255, 9, 185, 141),
      ), // BorderSide
    ), // OutlineInputBorder
  );
}