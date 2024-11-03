import 'package:flutter/material.dart';
import 'package:todo_app/components/item_detail.dart';
import 'package:todo_app/components/item_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<ItemDetail> items = [];
    return Scaffold(
        appBar: AppBar(
          title: const Text("Todo App"),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Column(
          mainAxisAlignment: items.isEmpty
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            items.isEmpty
                ? const Center(
                    child: Text("No new entry"),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return ItemTile(item: items[index]);
                      },
                    ),
                  ),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: addItem));
  }

  void addItem() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: const Center(
              child: Column(
                children: [Text("hello world")],
              ),
            ),
          );
        });
  }
}
