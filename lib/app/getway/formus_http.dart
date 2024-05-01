import 'package:dio/dio.dart';

class FormusHttp {
  final Map<String, String> _headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZjlmZDYyMzhiYmQ4ODMxNTg1ODQzZjdkYzE3YWQyNSIsInN1YiI6IjYwYjRmODUxYzc0MGQ5MDA1OTQyM2QwZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.s4U3veYnhZHcSVCOhVCIuEG16g9JuU08NY4V9kgk4w4'
  };
  final Dio _dio = Dio();

  get({required String url}) async {
    var response = await _dio.get(
      url,
      options: Options(
        headers: _headers,
      ),
    );

    return response.data;
  }
}
