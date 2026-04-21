import 'package:flutter/material.dart';
import 'package:first_project/page/beranda_page.dart';
import 'package:first_project/page/profile_page.dart';
import 'package:first_project/page/List_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [BerandaPage(), ProfilePage(), ListPage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Journey',
      debugShowCheckedModeBanner: false,

      // ===== THEME GLOBAL =====
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[100],
        fontFamily: 'Roboto', // opsional (lebih profesional)
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black87),
        ),
      ),

      home: Scaffold(
        // ===== APP BAR =====
        appBar: AppBar(
          toolbarHeight: 70,
          title: Row(
            children: [
              // ICON
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(
                  Icons.auto_stories,
                  color: Colors.black87,
                  size: 24,
                ),
              ),

              const SizedBox(width: 12),

              // TEXT
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'My Journey',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    'Track your growth & goals',
                    style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none),
            ),
            const SizedBox(width: 8),
          ],
        ),

        // ===== BODY =====
        body: _pages[_currentIndex],

        // ===== BOTTOM NAV =====
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.grey.shade300)),
          ),
          child: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (i) => setState(() => _currentIndex = i),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

            items: [
              SalomonBottomBarItem(
                icon: const Icon(Icons.home_outlined),
                title: const Text("Home"),
                selectedColor: Colors.black,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.person_outline),
                title: const Text("Profile"),
                selectedColor: Colors.black,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.list_alt_outlined),
                title: const Text("Plans"),
                selectedColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
