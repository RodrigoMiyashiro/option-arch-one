import 'package:testing_new_architecture/shared/ui/close_component/dimissable_view.dart';

class SimpleAlertDTO {
  String title;
  String description;
  String buttonTitle;
  DismissableView removeAlert;

  SimpleAlertDTO(
      {this.title, this.description, this.buttonTitle, this.removeAlert});
}
