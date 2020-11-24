import 'package:testing_new_architecture/features/user_summary/data/models/user_model.dart';
import 'package:testing_new_architecture/features/user_summary/domain/entities/user.dart';

class ModelConverter {
  List<User> convertToListUser<T>(dynamic result) {
    Iterable iterable = result;
    List<UserModel> userModel =
        iterable.map((model) => UserModel.fromJSON(model)).toList();
    List<User> users = userModel.map((model) => User.conveter(model)).toList();

    return users;
  }
}
