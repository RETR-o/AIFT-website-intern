

import 'package:act/HomePage/HomePage.dart';
import 'package:act/HomePage/scroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize ScreenUtil


  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}