import 'dart:convert';
import 'package:testing_new_architecture/shared/utils/model_converter/model_converter.dart';
import '../../../feature/user_summary/model/generate_mock.dart';
import '../parsable.dart';

class ParserMockJSON implements GenerationMock {
  @override
  Parsable parser;
  @override
  String path;

  ParserMockJSON({this.parser, this.path});

  @override
  Future<List> generate() async {
    String objectString = await parser.obtainFile(path);
    dynamic result = json.decode(objectString);
    ModelConverter converter = ModelConverter();

    return converter.convertToListUser(result);
  }
}
