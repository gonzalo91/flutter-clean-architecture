import 'package:http/http.dart' as http;
import 'package:learning/core/_shared/api/http_client.dart';

class HttpClientImpl implements HttpClient{
  static const mainUrl = "https://jsonplaceholder.typicode.com/";

  @override
  Future<http.Response> get(String url, Object data) async {
        
      var response = await http.get(
        Uri.parse(mainUrl + url),         
      );
      
      return response;
  }

  @override
  Future<http.Response> post(String url, Object data) async {
    var response = await http.post(
        Uri.parse(mainUrl + url),
        body: data,
      );
      
      return response;
  }

}