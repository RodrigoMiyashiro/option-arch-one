import 'package:testing_new_architecture/features/user_summary/domain/entities/user.dart';

abstract class UserSummaryReceiver {
  receiveUserSummary({List<User> users});
  handleUserSummaryFailure();
}
