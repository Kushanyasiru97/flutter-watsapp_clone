

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watsapp_clone/pages/chatPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  late TabController _controller;
  @override
  void initState(){
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex:0);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WHY APP'),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
            onPressed: () {  },
          ),
          PopupMenuButton<String> (
            onSelected: (value){
              print(value);
            },
              itemBuilder: (BuildContext context){
            return[
              PopupMenuItem(
                  child: Text("New group"),value: "New group",
              ),
              PopupMenuItem(
                child: Text("New broadcast"),value: "New broadcast",
              ),
              PopupMenuItem(
                child: Text("Linked devices"),value: "Linked devices",
              ),
              PopupMenuItem(
                child: Text("Starred messages"),value: "Starred messages",
              ),
              PopupMenuItem(
                child: Text("Setting"),value: "Setting",
              ),
            ];
          })
        ],

        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: "CHATS",
            ),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
         children: [
           Text("Camera"),
           ChatPage(),
           Text("Status"),
           Text("Calls")
         ],
      ),
    );
  }
}
