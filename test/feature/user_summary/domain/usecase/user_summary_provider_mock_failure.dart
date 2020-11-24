import 'package:testing_new_architecture/features/user_summary/domain/entities/user.dart';
import 'package:testing_new_architecture/features/user_summary/domain/usecase/user_summary_provider.dart';

class UserSummaryProviderMockFailure implements UserSummaryProvider {
  int callsToAvailableUserSummary = 0;

  @override
  Future<List<User>> obtainUserSummary() {
    callsToAvailableUserSummary += 1;

    throw Exception('mock error');
  }
}
