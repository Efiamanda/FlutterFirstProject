import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // ===== DATA PROFILE (BISA DI EDIT) =====
  String name = "Efi Amanda";
  String job = "Flutter Developer • Nail Artist";
  String about =
      "Passionate in building modern mobile apps and growing a personal beauty business.";

  List<String> skills = [
    "Flutter",
    "UI Design",
    "Dart",
    "Communication",
    "Business",
    "Nail Art",
  ];

  // ===== CONTROLLER EDIT =====
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _jobCtrl = TextEditingController();
  final TextEditingController _aboutCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameCtrl.text = name;
    _jobCtrl.text = job;
    _aboutCtrl.text = about;
  }

  // ===== DIALOG EDIT =====
  void _showEditDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Profile"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _nameCtrl,
                  decoration: const InputDecoration(labelText: "Name"),
                ),
                TextField(
                  controller: _jobCtrl,
                  decoration: const InputDecoration(labelText: "Job"),
                ),
                TextField(
                  controller: _aboutCtrl,
                  decoration: const InputDecoration(labelText: "About"),
                  maxLines: 3,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  name = _nameCtrl.text;
                  job = _jobCtrl.text;
                  about = _aboutCtrl.text;
                });
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // ===== HEADER (CENTER STYLE) =====
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8),
              ],
            ),
            child: Column(
              children: [
                // FOTO HEWAN (UNSPLASH)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1543466835-00a7907e9de1?q=80&w=300',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 12),

                // NAMA
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[900],
                  ),
                ),

                const SizedBox(height: 4),

                // JOB
                Text(
                  job,
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                ),

                const SizedBox(height: 12),

                // BUTTON EDIT
                OutlinedButton(
                  onPressed: _showEditDialog,
                  child: const Text("Edit Profile"),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ===== ABOUT =====
          _buildCard(
            title: "About Me",
            child: Text(
              about,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // ===== SKILLS =====
          _buildCard(
            title: "Skills",
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: skills.map((e) => _SkillTag(e)).toList(),
            ),
          ),

          const SizedBox(height: 20),

          // ===== ACTIVITY =====
          _buildCard(
            title: "Recent Activity",
            child: Column(
              children: const [
                _ActivityItem(
                  title: "Created new Flutter UI project",
                  time: "2 days ago",
                ),
                _ActivityItem(
                  title: "Learned state management",
                  time: "5 days ago",
                ),
                _ActivityItem(
                  title: "Started nail business",
                  time: "1 week ago",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ===== CARD TEMPLATE =====
  Widget _buildCard({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.grey[900],
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

// ===== SKILL TAG =====
class _SkillTag extends StatelessWidget {
  final String label;

  const _SkillTag(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 12, color: Colors.grey[800]),
      ),
    );
  }
}

// ===== ACTIVITY ITEM =====
class _ActivityItem extends StatelessWidget {
  final String title;
  final String time;

  const _ActivityItem({required this.title, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          const Icon(Icons.circle, size: 8, color: Colors.grey),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[900],
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  time,
                  style: TextStyle(fontSize: 11, color: Colors.grey[500]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
