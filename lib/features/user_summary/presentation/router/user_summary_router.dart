import 'package:flutter/material.dart';
import 'package:testing_new_architecture/features/user_summary/presentation/router/user_summary_routable.dart';
import 'package:testing_new_architecture/shared/infrastructure/model/simple_alert_dto.dart';
import 'package:testing_new_architecture/shared/ui/Alert/simple_alert.dart';

class UserSummaryRouter implements UserSummaryRoutable {
  @override
  void closeView(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  void showAlert(BuildContext context, SimpleAlertDTO simpleAlertDTO) {
    SimpleAlert simpleAlert = SimpleAlert(simpleAlertDTO: simpleAlertDTO);
    simpleAlert.build(context);
  }
}
