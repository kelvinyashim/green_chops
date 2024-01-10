import 'package:flutter/material.dart';
import 'package:green_chops/screens/chat/chatRoom.dart';
import 'package:green_chops/screens/form/login.dart';
import 'package:green_chops/services/chat/chat.dart';
import 'package:green_chops/widgets/userTile.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  final chatService = ChatService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Chat'),
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: chatService.getUsers(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            final users = snapshot.data;

            return ListView.builder(
              itemCount: users!.length,
              itemBuilder: (context, index) {
                if(users[index]["email"] != firebase.currentUser!.email){
                  return ListTile(
                  title: Text(users[index]["email"]),
                  textColor: Colors.black,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return ChatPage(
                          receiverEmail: users[index]["email"],
                          
                          );
                      },
                    ));
                  },
                );
                }
                return Container();
                
              },
            );
          },
        ));
  }
}
