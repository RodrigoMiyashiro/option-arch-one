import 'package:flutter/services.dart';

import '../parsable.dart';

class JSONParser implements Parsable {
  Future<String> obtainFile(String path) async {
    return await rootBundle.loadString(path);
  }
}
