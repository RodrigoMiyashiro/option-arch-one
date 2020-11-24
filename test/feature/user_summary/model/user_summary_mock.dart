import 'package:testing_new_architecture/features/user_summary/domain/entities/user.dart';

import '../../../shared/parser/json/json_parser.dart';
import '../../../shared/parser/parsable.dart';
import 'generate_mock.dart';
import 'generate_user_summary_mock.dart';

class UserSummaryMock {
  static Future<List<User>> validListUserSummary() async {
    try {
      Parsable parser = JSONParser();
      GenerationMock mock = GenerateUserSummaryMock(
          parser: parser, path: 'test/asset/mock/user_summary.json');
      List<User> users = await mock.generate();

      return users;
    } catch (error) {
      print('-->> Error.. $error');
      return List<User>();
    }
  }
}
