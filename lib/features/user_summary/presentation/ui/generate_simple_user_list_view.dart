import 'package:flutter/material.dart';
import 'package:testing_new_architecture/features/user_summary/domain/entities/user.dart';
import 'package:testing_new_architecture/features/user_summary/presentation/ui/simple_user_list_view.dart';
import 'package:testing_new_architecture/shared/ui/list/clickable_cell.dart';
import 'package:testing_new_architecture/shared/ui/list/generate_list_component.dart';
import 'package:testing_new_architecture/shared/ui/list/simple_list_viewable.dart';
import 'package:testing_new_architecture/shared/ui/placeholder/placeholder_center_view.dart';
import 'package:testing_new_architecture/shared/ui/selection/selection_item.dart';

class GenerateSimpleUserListView
    implements GenerateListComponent, SelectableItem {
  final PlaceholderCenterView _placeholder = PlaceholderCenterView();
  ClickableCell _clickableCell;

  GenerateSimpleUserListView({ClickableCell clickableCell})
      : _clickableCell = clickableCell;

  @override
  Widget generateComponent<T>({List<T> data}) {
    if (data == null) {
      return _placeholder.clearListPlaceholderCenter('Lista vazia...');
    }

    if (data.length == 0) {
      return _placeholder.clearListPlaceholderCenter('Lista zerada...');
    }

    if (!(data is List<User>)) {
      return _placeholder
          .clearListPlaceholderCenter('Não foi possível listar Users...');
    }

    SimpleListViewable listView = SimpleUserListView(tappedCell: this);
    return listView.buildListView(data as List<User>);
  }

  @override
  void selectedItem(BuildContext context, object) {
    _clickableCell.didTapCell(context, object);
  }
}
