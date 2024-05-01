import 'package:Formus/app/domains/models/movie_response.modal.dart';
import 'package:Formus/app/getway/formus_http.dart';

class MovieHttp extends FormusHttp {
  final String _url =
      'https://api.themoviedb.org/3/discover/movie?certification_country=US&include_adult=false&include_video=true&language=en-US&page=1&sort_by=popularity.desc';

  Future<MovieResponse> getMovieList() async {
    final response = await get(url: _url);
    return MovieResponse.fromJson(response);
  }
}
