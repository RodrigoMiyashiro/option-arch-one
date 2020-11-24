import 'package:testing_new_architecture/features/user_summary/domain/entities/user.dart';
import 'package:testing_new_architecture/features/user_summary/domain/usecase/user_summary_provider.dart';

import '../../model/user_summary_mock.dart';

class UserSummaryProviderMock implements UserSummaryProvider {
  int callsToAvailableUserSummary = 0;

  @override
  Future<List<User>> obtainUserSummary() async {
    callsToAvailableUserSummary += 1;

    return await UserSummaryMock.validListUserSummary();
  }
}
