import 'package:flutter/material.dart';
import 'package:testing_new_architecture/features/user_summary/domain/entities/user.dart';
import 'package:testing_new_architecture/shared/ui/selection/selection_item.dart';

abstract class SimpleListViewable {
  Widget buildListView(List<User> data);
  SelectableItem tappedCell;
}
