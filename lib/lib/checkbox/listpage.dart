import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  final List<Map<String, String>> plans = const [
    {"title": "Belajar Flutter", "subtitle": "Membuat aplikasi mobile"},
    {"title": "Belajar UI/UX", "subtitle": "Desain aplikasi modern"},
    {"title": "Belajar Backend", "subtitle": "API dan database"},
    {"title": "Project Pribadi", "subtitle": "Buat aplikasi sendiri"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: plans.length,
      itemBuilder: (context, index) {
        final item = plans[index];

        return Card(
          elevation: 3,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: const Icon(Icons.list, color: Colors.blue),
            ),
            title: Text(
              item["title"]!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(item["subtitle"]!),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          ),
        );
      },
    );
  }
}
