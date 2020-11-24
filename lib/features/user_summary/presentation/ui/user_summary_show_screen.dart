import 'package:testing_new_architecture/features/user_summary/domain/entities/user.dart';

abstract class UserSummaryShowScreen {
  showActivityIndicator();
  hideActivityIndicator();
  showUserSummary(List<User> users);
}
