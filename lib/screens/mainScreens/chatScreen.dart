import 'package:flutter/material.dart';
import 'package:green_chops/screens/chat/chatRoom.dart';
import 'package:green_chops/services/chat/chat.dart';
import 'package:green_chops/widgets/userTile.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  final chatService = ChatService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        centerTitle: true,
      ),
      body: buildUserList(),
    );
  }

  Widget buildUserList() {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: chatService.getuserStream(),
      builder: (context, snapshot) {
        //error
        if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
        }
        //loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Text("Loading"),
          );
        }
        final List<Map<String, dynamic>> userList = snapshot.data!;
        print("User List Length: ${userList.length}");
        return ListView(
            children: userList
                .map<Widget>((userData) => buildUserListItem(userData, context))
                .toList());
      },
    );
  }

//this is to build a tile for each user
//minus the curr user
  Widget buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    return UserTile(
      email: userData['email'],
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return ChatPage(
              receiverEmail: userData["email"],
            );
          },
        ));
      },
    );
  }
}
