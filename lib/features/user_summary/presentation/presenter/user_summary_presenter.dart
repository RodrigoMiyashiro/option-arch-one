import 'package:flutter/src/widgets/framework.dart';
import 'package:testing_new_architecture/features/user_summary/data/repository/user_summary_repository.dart';
import 'package:testing_new_architecture/features/user_summary/data/repository/user_summary_repository_listener.dart';
import 'package:testing_new_architecture/features/user_summary/domain/entities/user.dart';
import 'package:testing_new_architecture/features/user_summary/domain/usecase/user_summary_receiver.dart';
import 'package:testing_new_architecture/features/user_summary/presentation/presenter/user_summary_presentable.dart';
import 'package:testing_new_architecture/features/user_summary/presentation/router/user_summary_routable.dart';
import 'package:testing_new_architecture/features/user_summary/presentation/router/user_summary_router.dart';
import 'package:testing_new_architecture/features/user_summary/presentation/ui/user_summary_show_screen.dart';
import 'package:testing_new_architecture/shared/infrastructure/model/simple_alert_dto.dart';

class UserSummaryPresenter
    implements UserSummaryPresentable, UserSummaryRepositoryListener {
  final UserSummaryShowScreen _screen;
  UserSummaryRepository _repository;
  UserSummaryRoutable _router;

  UserSummaryPresenter(this._screen) {
    _repository = UserSummaryRepository(listener: this);
    _router = UserSummaryRouter();
  }

  @override
  performUserSummary() {
    _screen.showActivityIndicator();
    _repository.executeUserSummaryUseCase();
  }

  @override
  dealWithFailingUserSummary() {
    _screen.hideActivityIndicator();
  }

  @override
  dealWithSuccessUserSummary({List<User> users}) {
    _screen.hideActivityIndicator();
    _screen.showUserSummary(users);
  }

  @override
  performCloseView(BuildContext context) {
    _router.closeView(context);
  }

  @override
  performShowAlert(BuildContext context, SimpleAlertDTO simpleAlertDTO) {
    _router.showAlert(context, simpleAlertDTO);
  }
}
