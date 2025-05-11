import 'dart:developer';
import 'package:articles/controller/session_data.dart';
import 'package:articles/view/favorite_screen.dart';
import 'package:articles/view/home_screen.dart';
import 'package:articles/view/search_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  final List _page = [
    const HomeScreen(),
    const SearchScreen(),
    const FavoriteScreen(),
  ];
  int _selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    log("Width ${MediaQuery.of(context).size.width}");
    log("FavList ${SessionData.favList}");
    return Scaffold(
      body: _page[_selectedPage],
      bottomNavigationBar: CurvedNavigationBar(
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          Icon(
            Icons.favorite_outlined,
            color: Colors.white,
          ),
        ],
        height: MediaQuery.of(context).size.width * 0.122767857,
        color: const Color.fromRGBO(16, 96, 72, 1),
        backgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
      ),
    );
  }
}
