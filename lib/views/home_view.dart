import 'package:flutter/material.dart';
import 'package:todo_app/components/item_detail.dart';
import 'package:todo_app/components/item_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ItemDetail> items = [];
  @override
  Widget build(BuildContext context) {
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
        floatingActionButton: FloatingActionButton(
            onPressed: newItemAddView, child: const Icon(Icons.add)));
  }

  void newItemAddView() {
    TextEditingController controller = TextEditingController();
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.white,
        context: context,
        builder: (BuildContext context) {
          return Padding(
            // padding: EdgeInsets.only(
            //     bottom: MediaQuery.of(context).viewInsets.bottom),
            padding: MediaQuery.of(context).viewInsets,
            // in case the keyboard pops up when typing input
            child: SizedBox(
              height: 250,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: Column(
                    children: [
                      TextField(
                        keyboardType: TextInputType.text,
                        controller: controller,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            hintText: "go on a field trip"),
                      ),
                      IconButton(
                        onPressed: () {
                          if (controller.text.toString() != "") {
                            ItemDetail temp = ItemDetail();
                            temp.text = controller.text.toString();
                            temp.itemId = 1;
                            setState(() {
                              items.add(temp);
                            });
                            Navigator.pop(context);
                          }
                        },
                        icon: const Icon(Icons.check_circle),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
