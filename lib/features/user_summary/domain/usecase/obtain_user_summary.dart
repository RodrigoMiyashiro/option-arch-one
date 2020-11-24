import 'package:flutter/material.dart';
import 'package:testing_new_architecture/features/user_summary/domain/entities/user.dart';
import 'package:testing_new_architecture/features/user_summary/domain/usecase/user_summary_provider.dart';
import 'package:testing_new_architecture/features/user_summary/domain/usecase/user_summary_receiver.dart';
import 'package:testing_new_architecture/shared/UseCase/UseCase.dart';

class ObtainUserSummary implements UseCase {
  UserSummaryProvider _provider;
  UserSummaryReceiver _receiver;

  ObtainUserSummary({
    @required UserSummaryReceiver receiver,
    @required UserSummaryProvider provider,
  })  : this._provider = provider,
        this._receiver = receiver;

  @override
  execute() async {
    try {
      List<User> users = await _provider.obtainUserSummary();

      _receiver.receiveUserSummary(users: users);
    } catch (error) {
      _receiver.handleUserSummaryFailure();
    }
  }
}
