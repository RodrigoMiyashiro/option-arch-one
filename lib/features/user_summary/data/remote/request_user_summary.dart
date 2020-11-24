import 'package:testing_new_architecture/features/user_summary/domain/entities/user.dart';
import 'package:testing_new_architecture/features/user_summary/domain/usecase/user_summary_provider.dart';
import 'package:testing_new_architecture/shared/infrastructure/model/response_api.dart';
import 'package:testing_new_architecture/shared/infrastructure/remote/http_client.dart';
import 'package:testing_new_architecture/shared/infrastructure/remote/path/remote_address.dart';
import 'package:testing_new_architecture/shared/utils/model_converter/model_converter.dart';

class RequestUserSummary implements UserSummaryProvider {
  final _modelConverter = ModelConverter();
  HttpClient _httpClient;

  RequestUserSummary({HttpClient httpClient}) : this._httpClient = httpClient;

  @override
  Future<List<User>> obtainUserSummary() async {
    try {
      final remoteAddress = RemoteAddress(path: 'users');
      final url = remoteAddress.obtainEndpoint();

      final ResponseAPI response = await _httpClient.get(url);

      if (response == null) {
        return null;
      }

      if (response.error != null) {
        throw Exception(response.error);
      }

      return _modelConverter.convertToListUser(response.result);
    } catch (error) {
      throw Exception(error);
    }
  }
}
