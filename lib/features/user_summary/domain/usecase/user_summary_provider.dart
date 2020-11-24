import 'package:testing_new_architecture/features/user_summary/domain/entities/user.dart';

abstract class UserSummaryProvider {
  Future<List<User>> obtainUserSummary();
}
