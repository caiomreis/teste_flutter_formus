import 'package:Formus/app/domains/models/movie_response.modal.dart';
import 'package:Formus/app/getway/movie_http.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isLoading = RxBool(false);
  final MovieHttp _movieHttp = MovieHttp();
  final Rx<List<Results>> movies = Rx([]);

  @override
  Future<void> onInit() async {
    super.onInit();
    await getMovieList();
  }

  getMovieList() async {
    isLoading = RxBool(true);
    try {
      final MovieResponse response = await _movieHttp.getMovieList();
      movies.value = response.results!;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    isLoading.value = false;
  }
}
