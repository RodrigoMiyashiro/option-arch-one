import 'dart:async';
import 'package:testing_new_architecture/shared/infrastructure/model/response_api.dart';

abstract class HttpClient {
  Future<ResponseAPI> get(String url);
}
