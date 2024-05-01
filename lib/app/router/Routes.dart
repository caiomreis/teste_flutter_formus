// ignore_for_file: file_names

import 'package:Formus/app/view/Home/home.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Routes {
  BuildContext context;
  Routes(this.context);

  static final List<GetPage> router = [
    GetPage(name: '/home', page: () => Home()),
  ];
}
