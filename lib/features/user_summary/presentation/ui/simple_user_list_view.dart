import 'package:flutter/material.dart';
import 'package:testing_new_architecture/features/user_summary/domain/entities/user.dart';
import 'package:testing_new_architecture/shared/ui/list/simple_list_viewable.dart';
import 'package:testing_new_architecture/shared/ui/placeholder/placeholder_center_view.dart';
import 'package:testing_new_architecture/shared/ui/selection/selection_item.dart';

class SimpleUserListView implements SimpleListViewable {
  @override
  SelectableItem tappedCell;

  SimpleUserListView({Key key, @required this.tappedCell});

  @override
  Widget buildListView(List<User> data) {
    if (data.length > 0) {
      return ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          User user = data[index];
          return _cell(context, user);
        },
      );
    }

    PlaceholderCenterView placeholder = PlaceholderCenterView();
    return placeholder.clearListPlaceholderCenter("Erro na lista...");
  }

  Widget _cell(BuildContext context, User user) {
    return ListTile(
      key: Key('item_${user.name}_name'),
      title: Text('${user.name}'),
      subtitle: Text('${user.email}'),
      onTap: () => tappedCell.selectedItem(context, user),
    );
  }
}
