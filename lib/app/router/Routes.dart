// ignore_for_file: file_names

import 'package:Formus/app/view/Home/home.dart';
import 'package:Formus/app/view/MovieDetail/movie_detail.dart';
import 'package:Formus/app/view/Search/search.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Routes {
  BuildContext context;
  Routes(this.context);

  static final List<GetPage> router = [
    GetPage(
      name: '/home',
      page: () => const Home(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: '/search',
      page: () => const Search(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: '/movie_detail',
      page: () => const MovieDetail(),
      transition: Transition.fadeIn,
    ),
  ];
}
