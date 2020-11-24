import '../../../shared/parser/parsable.dart';

abstract class GenerationMock {
  Parsable parser;
  String path;

  Future<List> generate();
}
