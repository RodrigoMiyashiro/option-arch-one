import 'package:testing_new_architecture/features/user_summary/domain/entities/user.dart';
import 'package:testing_new_architecture/features/user_summary/domain/usecase/user_summary_receiver.dart';

class UserSummaryReceiverMock implements UserSummaryReceiver {
  int callsToReceiverUserSummary = 0;
  int callsToHandleErrorObtainingUserSummary = 0;

  List<User> users;

  @override
  handleUserSummaryFailure() {
    callsToHandleErrorObtainingUserSummary += 1;
  }

  @override
  receiveUserSummary({List<User> users}) {
    callsToReceiverUserSummary += 1;

    this.users = users;
  }
}
