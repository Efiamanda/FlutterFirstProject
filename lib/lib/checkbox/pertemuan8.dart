import 'package:flutter/material.dart';

class AutocompletespinPage extends StatelessWidget {
  final List<String> options = ["Jakarta", "Bandung", "Bali"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Autocomplete")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Autocomplete<String>(
          optionsBuilder: (text) {
            return options.where(
              (item) => item.toLowerCase().contains(text.text.toLowerCase()),
            );
          },
        ),
      ),
    );
  }
}
