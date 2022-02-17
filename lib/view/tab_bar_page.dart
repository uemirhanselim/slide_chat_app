import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:slide_chat_app/helpers/color_helper.dart';
import 'package:slide_chat_app/view/conversations_page.dart';
import 'package:slide_chat_app/view/discover_page.dart';
import 'package:slide_chat_app/view/profile_page.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarPage> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  int _selectedIndex = 1;
  final tabs = [
    ConversationsPage(),
    DiscoverPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorHelper.backgroundColor,
        body: tabs[_selectedIndex],
        bottomNavigationBar: Container(
          child: buildBottomNavigationBar(),
        ),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
        });
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.messenger), label: 'Chats'),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'People'),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 14,
            backgroundImage: AssetImage('images/slide.png'),
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
