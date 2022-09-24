import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatRoomScreen extends StatelessWidget {
  const ChatRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          leading: const Icon(Icons.menu),
          title: const Text("聊天室"),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(Icons.note_add_outlined),
            )
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        children: [
          const CupertinoSearchTextField(),
          const SizedBox(height: 10),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: const Icon(Icons.video_call),
              )
            ],
          ),
          const SizedBox(height: 10),
          const ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://pbs.twimg.com/profile_images/1187814172307800064/MhnwJbxw_400x400.jpg"),
            ),
            title: Text("FirstName"),
            subtitle: Text("Last Message"),
            trailing: Icon(Icons.check_circle),
          ),
          const ListTile(
            leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://pbs.twimg.com/profile_images/1455185376876826625/s1AjSxph_400x400.jpg")),
            title: Text("SecondName"),
            subtitle: Text("Last Message"),
            trailing: Icon(Icons.check_circle),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.message), label: "聊天室"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "用戶"),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(
                  "https://pbs.twimg.com/profile_images/1187814172307800064/MhnwJbxw_400x400.jpg"),
            ),
            label: "設定"),
      ]),
    );
  }
}
