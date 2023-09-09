import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/data/photo_api_repository.dart';
import 'package:image_search/model/photo.dart';

class PixabayAPI implements PhotoAPIRepository{
  final key = '10711147-dc41758b93b263957026bdadb';

  @override
  Future<Result<List<Photo>>> fetch(String query, {http.Client? client}) async {
    client ??= http.Client();

    final url = Uri.https(
      'pixabay.com',
      '/api/',
      {
        'key': key,
        'q': query,
        'image_type': 'photo',
      },
    );

    try {
      final response = await client.get(url); //http.get()은 기본 client를 사용하는 것, client.get()은 설정한 client를 사용하는 것
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      Iterable hits = jsonResponse['hits'];
      return Result.success( hits.map((e) => Photo.fromJson(e)).toList() );
    } catch (e) {
      return Result.error('Internet disable');
    }
  }
}