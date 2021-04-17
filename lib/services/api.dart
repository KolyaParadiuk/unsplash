import 'package:dio/dio.dart';
import 'package:unsplash/models/photo.dart';
import 'package:unsplash/models/serializers.dart';

class ApiService {
  final Dio _client = Dio();
  ApiService(apiUrl, token) {
    _client.options.baseUrl = apiUrl;
    _client.options.headers = {
      "Authorization": "Client-ID $token",
      "Accept-Version": "v1"
    };
  }

  Future<List<Photo>> getImages(int page,int perPage) async {
    Response response = await _client.get('/photos',
          queryParameters: {"page":page.toString(),"per_page":perPage.toString()});
      return response.data!.map((element) {
        Photo? p = serializers.deserializeWith(Photo.serializer, element);
        return p;
      });
    }
  
  Future<List<Photo>> searchImages(String query, int page,int perPage) async {
    Response response = await _client.get('/search/photos',
          queryParameters: {"query":query,"page":page.toString(),"per_page":perPage.toString()});
      return response.data!["results"].map((element) {
        Photo? p = serializers.deserializeWith(Photo.serializer, element);
        return p;
      });
    }
}
