import 'package:Formus/app/domains/models/movie_response.modal.dart';
import 'package:Formus/app/getway/movie_http.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isLoading = RxBool(false);
  final MovieHttp _movieHttp = MovieHttp();
  late Rx<List<Results>> movies;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getMovieList();
  }

  getMovieList() async {
    try {
      final MovieResponse response = await _movieHttp.getMovieList();
      movies = Rx(response.results!);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
