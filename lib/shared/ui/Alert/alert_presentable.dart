import 'package:flutter/material.dart';
import 'package:testing_new_architecture/shared/infrastructure/model/simple_alert_dto.dart';

abstract class AlertPresentable {
  performCloseView(BuildContext context);
  performShowAlert(BuildContext context, SimpleAlertDTO simpleAlertDTO);
}
