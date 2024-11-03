import 'package:flutter/material.dart';
import 'package:todo_app/components/item_detail.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({super.key, required this.item});
  final ItemDetail item;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // style: : ,
        leading: Checkbox(
          value: item.isDone,
          onChanged: (bool? value) {
            //TODO try passing down the methods here
          },
        ),
        title: Text('${item.text}'),
        trailing: IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ),
    );
  }
}
