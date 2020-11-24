import 'package:http/http.dart' as http;
import 'package:testing_new_architecture/shared/infrastructure/model/response_api.dart';
import 'package:testing_new_architecture/shared/infrastructure/remote/http_client.dart';

class DefaultHTTPClient implements HttpClient {
  @override
  Future<ResponseAPI> get(String url) async {
    try {
      http.Response response = await http.get(url);
      return ResponseAPI.fromResponse(response);
    } catch (e) {
      throw Exception("ErRoR.... ${e.toString()}");
    }
  }
}
