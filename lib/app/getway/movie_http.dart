import 'package:Formus/app/domains/models/cast_reponse.model.dart';
import 'package:Formus/app/domains/models/detail_movie_response.model.dart';
import 'package:Formus/app/domains/models/movie_response.model.dart';
import 'package:Formus/app/domains/models/search_response.model.dart';
import 'package:Formus/app/getway/formus_http.dart';

class MovieHttp extends FormusHttp {
  Future<MovieResponse> getMovieList({int? page}) async {
    final response = await get(
        url:
            'https://api.themoviedb.org/3/discover/movie?certification_country=US&include_adult=false&include_video=true&language=en-US&page=${page ?? 1}&sort_by=popularity.desc');
    return MovieResponse.fromJson(response);
  }

  Future<SearchMovieResponse> getSearchMovies({
    required String name,
    int? page,
  }) async {
    final response = await get(
      url:
          'https://api.themoviedb.org/3/search/movie?query=$name&include_adult=false&language=en-US&page=${page ?? 1}',
    );
    return SearchMovieResponse.fromJson(response);
  }

  Future<MovieDetailResponse> getDetailMovie(
    String id,
  ) async {
    final response = await get(
      url: 'https://api.themoviedb.org/3/movie/$id?language=en-US',
    );
    return MovieDetailResponse.fromJson(response);
  }

  Future<CastResponse> getCast(
    String id,
  ) async {
    final response = await get(
      url: 'https://api.themoviedb.org/3/movie/$id/credits?language=en-US',
    );
    return CastResponse.fromJson(response);
  }
}
