import 'dart:convert';

import 'package:testing_new_architecture/shared/utils/model_converter/model_converter.dart';
import '../../../shared/parser/parsable.dart';
import 'generate_mock.dart';

class GenerateUserSummaryMock implements GenerationMock {
  @override
  Parsable parser;
  @override
  String path;

  GenerateUserSummaryMock({this.parser, this.path});

  @override
  Future<List> generate() async {
    String objectString = await parser.obtainFile(path);
    dynamic result = json.decode(objectString);
    ModelConverter converter = ModelConverter();

    return converter.convertToListUser(result);
  }
}
