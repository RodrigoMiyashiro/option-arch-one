import 'package:flutter/material.dart';
import 'package:testing_new_architecture/shared/infrastructure/remote/path/remote_provider.dart';

class RemoteAddress extends RemoteProvider {
  String path;

  RemoteAddress({@required this.path});

  String obtainEndpoint() {
    return baseRemoteAddress() + path;
  }
}
