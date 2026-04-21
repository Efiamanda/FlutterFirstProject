import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // ===== HEADER =====
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                // FOTO
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1516979187457-637abb4f9353?auto=format&fit=crop&w=200&q=80',
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(width: 12),

                // TEXT
                Expanded(
                  child: Text(
                    'Welcome back, Efi 👋\nReady to continue your progress today?',
                    style: TextStyle(fontSize: 14, color: Colors.grey[900]),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ===== PROGRESS =====
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6),
              ],
            ),
            child: Row(
              children: [
                const Icon(Icons.bar_chart, size: 24),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Progress',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.grey[900],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'You have completed 75% of your weekly goals',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 10),

                      // PROGRESS BAR
                      LinearProgressIndicator(
                        value: 0.75,
                        minHeight: 6,
                        backgroundColor: Colors.grey[300],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ===== MOTIVATION =====
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                const Icon(Icons.lightbulb_outline, size: 24),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Consistency beats motivation. Keep moving forward every day.',
                    style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
