import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:username_gen/username_gen.dart';
import 'dart:math';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  Widget story() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
          children: [
            for (int i = 0; i < 20; i++) const StoryCard(),
          ]),
    );
  }

  Widget onlineUsers() {
    return ListView(
      children: [
        const ListTile(
          leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://pbs.twimg.com/profile_images/1455185376876826625/s1AjSxph_400x400.jpg")),
          title: Text("Google"),
        ),
        const ListTile(
          leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://pbs.twimg.com/profile_images/1187814172307800064/MhnwJbxw_400x400.jpg")),
          title: Text("Flutter"),
        ),
        for (int i = 0; i < 49; i++)
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(Random.secure().nextInt(16777215) |
                  0xFF000000), // generate random color
              child: Text("F$i"),
            ),
            title: Text(UsernameGen().generate()),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[
          const TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1,
            labelColor: Colors.black,
            labelStyle: TextStyle(fontSize: 12),
            tabs: <Widget>[
              Tab(
                text: "限時動態",
              ),
              Tab(text: "在線上")
            ],
          ),
          Expanded(
            child: TabBarView(
              children: <Widget>[story(), onlineUsers()],
            ),
          ),
        ],
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  const StoryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            "https://blogger.googleusercontent.com/img/a/AVvXsEiBvTaWkOFFihJud4ctimi-3DXWWjwU_x98aUPlba97hoBkHFASSExnr4U5JatHKG_PTDVeyDJ37dPC1EbAtGLNPZP9ixKznYdrTee8cs8kEiiiDfFdHUJ3JDMg2rGLCDCsmYMxSKzq7ci_PrWr4UEuPW1I5VVPTOHY282HjbC4AU5tCVqnvsu-Ss3p",
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.grey,
                  backgroundColor: Colors.white,
                  shape: const CircleBorder(), // <-- Splash color
                ),
                onPressed: () => {},
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "新增到限時動態",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
