import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homeProvider.dart';

var allProvider = [
  ChangeNotifierProvider(create: (_) => HomeProvider()),
];
