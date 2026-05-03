import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  final List<String> items = ["Apple", "Banana", "Orange"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List View")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(items[index]));
        },
      ),
    );
  }
}
