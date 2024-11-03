import 'package:flutter/material.dart';
import 'package:todo_app/components/item_detail.dart';

class ItemTile extends StatefulWidget {
  const ItemTile({super.key, required ItemDetail item});

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  @override
  Widget build(BuildContext context) {
    return const ListTile();
  }
}
