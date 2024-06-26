import 'package:Formus/app/components/formus_snackbar/formus_snackbar.dart';
import 'package:Formus/app/domains/models/movie_response.model.dart';
import 'package:Formus/app/getway/movie_http.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final MovieHttp _movieHttp = MovieHttp();
  bool isLoading = false;
  List<Results> movies = [];
  int page = 1;
  bool loadingMore = false;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getMovieList();
  }

  getMovieList() async {
    isLoading = true;
    try {
      final MovieResponse response = await _movieHttp.getMovieList(page: page);
      movies = response.results!;
      page = response.page!;
    } catch (e) {
      FormusSnackBar.simple(
        title: 'Erro ao carregar filmes',
        kind: FormusSnackBarKindEnum.error,
      );
    } finally {
      isLoading = false;
      update();
    }
  }

  loadMoreMovies() async {
    loadingMore = false;
    try {
      final MovieResponse response =
          await _movieHttp.getMovieList(page: page + 1);
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
