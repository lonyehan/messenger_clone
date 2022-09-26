import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:messenger_clone/screen/ChatRoomScreen.dart';
import 'package:messenger_clone/screen/SettingScreen.dart';
import 'package:messenger_clone/screen/UsersScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _currentIndex = 0;
  late String _title = title(0);
  late List<Widget> _actions = [];
  late Widget? _leading;

  @override
  void initState() {
    super.initState();
    setState(() {
      _title = title(_currentIndex);
      _actions = actions(_currentIndex);
      _leading = leading(_currentIndex);
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      _title = title(_currentIndex);
      _actions = actions(_currentIndex);
      _leading = leading(_currentIndex);
    });
  }

  // get title
  String title(int index) {
    late String result;
    switch (index) {
      case 0:
        result = "聊天室";
        break;
      case 1:
        result = "用戶";
        break;
      case 2:
        result = "設定";
        break;
      default:
        throw Exception("No Title in this index.");
    }

    return result;
  }

  // get actions
  List<Widget> actions(int index) {
    List<Widget> result = <Widget>[];
    switch (index) {
      case 0:
        result.add(const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Icon(Icons.note_add_outlined),
        ));
        break;
      case 1:
        result.add(const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Icon(Icons.contact_page),
        ));
        break;
      case 2:
        break;
      default:
        throw Exception("No Actions in this index.");
    }

    return result;
  }

  // get actions
  Widget? leading(int index) {
    late Widget? result;
    switch (index) {
      case 0:
        result = const Icon(Icons.menu);
        break;
      case 1:
      case 2:
        result = null;
        break;
      default:
        throw Exception("No leading in this index.");
    }

    return result;
  }

  // Get body's content
  Widget content(int index) {
    late Widget result;
    switch (index) {
      case 0:
        result = const ChatRoomScreen();
        break;
      case 1:
        result = const UsersScreen();
        break;
      case 2:
        result = const SettingScreen();
        break;
      default:
        throw Exception("No Page in this index.");
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          leading: _leading,
          title: Text(_title),
          actions: _actions,
        ),
      ),
      body: content(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "聊天室"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "用戶"),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(
                    "https://pbs.twimg.com/profile_images/1187814172307800064/MhnwJbxw_400x400.jpg"),
              ),
              label: "設定"),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
