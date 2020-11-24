import 'package:flutter/services.dart';
import '../parser/parsable.dart';

class ObtainFileLocal implements Parsable {
  @override
  Future<String> obtainFile(String path) async {
    return await rootBundle.loadString(path);
  }
}
