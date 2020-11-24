import 'package:flutter_test/flutter_test.dart';
import 'package:testing_new_architecture/features/user_summary/domain/entities/user.dart';
import 'package:testing_new_architecture/features/user_summary/domain/usecase/obtain_user_summary.dart';

import '../../model/user_summary_mock.dart';
import 'user_summary_provider_mock.dart';
import 'user_summary_provider_mock_failure.dart';
import 'user_summary_receiver_mock.dart';

main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ObtainUserSummary class', () {
    UserSummaryReceiverMock _receiver;

    setUpAll(() {
      _receiver = UserSummaryReceiverMock();
    });

    tearDownAll(() {
      _receiver = null;
    });

    test("Successfully", () async {
      UserSummaryProviderMock provider = UserSummaryProviderMock();
      ObtainUserSummary userSummary =
          ObtainUserSummary(receiver: _receiver, provider: provider);
      await userSummary.execute();

      expect(provider.callsToAvailableUserSummary, 1);
      expect(_receiver.callsToReceiverUserSummary, 1);
    });

    test("Failure", () async {
      UserSummaryProviderMockFailure provider =
          UserSummaryProviderMockFailure();
      ObtainUserSummary userSummary =
          ObtainUserSummary(receiver: _receiver, provider: provider);
      await userSummary.execute();

      expect(provider.callsToAvailableUserSummary, 1);
      expect(_receiver.callsToHandleErrorObtainingUserSummary, 1);
    });
  });
}
