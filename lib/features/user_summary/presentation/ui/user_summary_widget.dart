import 'package:flutter/material.dart';
import 'package:testing_new_architecture/features/user_summary/domain/entities/user.dart';
import 'package:testing_new_architecture/features/user_summary/presentation/presenter/user_summary_presentable.dart';
import 'package:testing_new_architecture/features/user_summary/presentation/presenter/user_summary_presenter.dart';
import 'package:testing_new_architecture/features/user_summary/presentation/ui/generate_simple_user_list_view.dart';
import 'package:testing_new_architecture/features/user_summary/presentation/ui/user_summary_show_screen.dart';
import 'package:testing_new_architecture/shared/infrastructure/model/simple_alert_dto.dart';
import 'package:testing_new_architecture/shared/ui/close_component/dimissable_view.dart';
import 'package:testing_new_architecture/shared/ui/list/clickable_cell.dart';
import 'package:testing_new_architecture/shared/ui/list/generate_list_component.dart';

class UserSummaryWidget extends StatefulWidget {
  UserSummaryWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _UserSummaryWidgetState createState() => _UserSummaryWidgetState();
}

class _UserSummaryWidgetState extends State<UserSummaryWidget>
    implements UserSummaryShowScreen, ClickableCell, DismissableView {
  UserSummaryPresentable _presenter;
  List<User> _users = [];

  @override
  void initState() {
    super.initState();

    _presenter = UserSummaryPresenter(this);
    _presenter.performUserSummary();
  }

  @override
  Widget build(BuildContext context) {
    GenerateListComponent generate =
        GenerateSimpleUserListView(clickableCell: this);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: generate.generateComponent(data: _users),
    );
  }

  @override
  hideActivityIndicator() {
    print('-->> Show activity Indicator');
  }

  @override
  showActivityIndicator() {
    print('-->> Hide activity Indicator');
  }

  @override
  showUserSummary(List<User> users) {
    setState(() {
      this._users = users;
    });
  }

  @override
  void didTapCell(BuildContext context, object) {
    SimpleAlertDTO simpleAlertDTO = SimpleAlertDTO(
        title: 'Error',
        description: 'Sorry...',
        buttonTitle: 'Ok',
        removeAlert: this);

    if (object is User) {
      simpleAlertDTO = SimpleAlertDTO(
          title: object.name,
          description: object.email,
          buttonTitle: 'Ok',
          removeAlert: this);
    }

    _presenter.performShowAlert(context, simpleAlertDTO);
  }

  @override
  void dismiss(BuildContext context) {
    _presenter.performCloseView(context);
  }
}
