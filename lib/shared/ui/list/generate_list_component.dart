import 'package:flutter/material.dart';

abstract class GenerateListComponent {
  Widget generateComponent<T>({List<T> data});
}
