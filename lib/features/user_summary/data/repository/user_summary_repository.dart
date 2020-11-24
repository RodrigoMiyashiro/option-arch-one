import 'package:testing_new_architecture/features/user_summary/data/remote/request_user_summary.dart';
import 'package:testing_new_architecture/features/user_summary/data/repository/user_summary_repository_listener.dart';
import 'package:testing_new_architecture/features/user_summary/domain/entities/user.dart';
import 'package:testing_new_architecture/features/user_summary/domain/usecase/obtain_user_summary.dart';
import 'package:testing_new_architecture/features/user_summary/domain/usecase/user_summary_receiver.dart';
import 'package:testing_new_architecture/shared/infrastructure/remote/default_http_client.dart';
import 'package:testing_new_architecture/shared/infrastructure/remote/http_client.dart';

class UserSummaryRepository implements UserSummaryReceiver {
  UserSummaryRepositoryListener _listener;

  UserSummaryRepository({UserSummaryRepositoryListener listener})
      : this._listener = listener;

  executeUserSummaryUseCase() {
    HttpClient httpClient = DefaultHTTPClient();
    final provider = RequestUserSummary(httpClient: httpClient);
    final performUseCase =
        ObtainUserSummary(receiver: this, provider: provider);

    performUseCase.execute();
  }

  @override
  handleUserSummaryFailure() {
    _listener.dealWithFailingUserSummary();
  }

  @override
  receiveUserSummary({List<User> users}) {
    _listener.dealWithSuccessUserSummary(users: users);
  }
}
