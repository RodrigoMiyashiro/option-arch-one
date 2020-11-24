import 'package:flutter/material.dart';
import 'package:testing_new_architecture/shared/infrastructure/model/simple_alert_dto.dart';

abstract class UserSummaryRoutable {
  void showAlert(BuildContext context, SimpleAlertDTO simpleAlertDTO);
  void closeView(BuildContext context);
}
