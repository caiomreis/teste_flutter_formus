import 'package:Formus/app/components/formus_snackbar/formus_snackbar.dart';
import 'package:Formus/app/domains/models/cast_reponse.model.dart';
import 'package:Formus/app/domains/models/detail_movie_response.model.dart';
import 'package:Formus/app/getway/movie_http.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController {
  bool isLoading = false;
  final MovieHttp _movieHttp = MovieHttp();
  late MovieDetailResponse movie;
  List<Cast> cast = [];
  TextEditingController textEditingController = TextEditingController();
  bool loadingMore = false;
  bool loadingCast = false;
  int page = 1;
  String name = '';
  @override
  Future<void> onInit() async {
    super.onInit();

    await getSearchMovie();
    await getCast();
    update();
  }

  getSearchMovie() async {
    isLoading = true;
    try {
      final MovieDetailResponse response = await _movieHttp.getDetailMovie(
        MovieDetailParams.fromJson(Get.parameters).id!,
      );

      movie = response;
    } catch (e) {
      FormusSnackBar.simple(
        title: 'Erro ao carregar mais filmes',
        kind: FormusSnackBarKindEnum.error,
      );
    } finally {
      isLoading = false;
    }
  }

  getCast() async {
    loadingCast = true;
    try {
      final CastResponse responseCast = await _movieHttp.getCast(
        MovieDetailParams.fromJson(Get.parameters).id!,
      );
      cast = responseCast.cast!;
    } catch (e) {
      FormusSnackBar.simple(
        title: 'Erro ao carregar mais filmes',
        kind: FormusSnackBarKindEnum.error,
      );
    } finally {
      loadingCast = false;
    }
  }
}
