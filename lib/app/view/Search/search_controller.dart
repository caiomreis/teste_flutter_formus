import 'package:Formus/app/components/formus_snackbar/formus_snackbar.dart';
import 'package:Formus/app/domains/models/search_response.model.dart';
import 'package:Formus/app/getway/movie_http.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPageController extends GetxController {
  bool isLoading = false;
  final MovieHttp _movieHttp = MovieHttp();
  List<Results> movies = [];
  TextEditingController textEditingController = TextEditingController();
  bool loadingMore = false;
  int page = 1;
  String name = '';

  getSearchMovie() async {
    isLoading = true;
    try {
      final SearchMovieResponse response = (await _movieHttp.getSearchMovies(
        name: name,
      ));
      movies = response.results!;
    } catch (e) {
      FormusSnackBar.simple(
        title: 'Erro ao carregar mais filmes',
        kind: FormusSnackBarKindEnum.error,
      );
    } finally {
      isLoading = false;
      update();
    }
    isLoading = false;
  }

  loadMoreMovies() async {
    loadingMore = false;
    try {
      final SearchMovieResponse response = (await _movieHttp.getSearchMovies(
        name: name,
        page: page + 1,
      ));
      for (var el in response.results!) {
        movies.add(el);
      }
      page = response.page!;
    } catch (e) {
      FormusSnackBar.simple(
        title: 'Erro ao carregar mais filmes',
        kind: FormusSnackBarKindEnum.error,
      );
    } finally {
      loadingMore = false;
      update();
    }
  }
}
