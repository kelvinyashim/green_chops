import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:green_chops/model/chat/message.dart';
import 'package:green_chops/screens/form/login.dart';

class ChatService {
  //first we get the instance of firestore
  final firestore = FirebaseFirestore.instance;

  //now we get the user stream to display the users
  Stream<List<Map<String, dynamic>>> getUsers() {
    return firestore.collection("user").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  //send message

  Future<void> sendMessage(String receiverId, message) async {
    //get current user info
    final currUserId = firebase.currentUser!.uid;
    final currUserEmail = firebase.currentUser!.email;
    final timestamp = Timestamp.now();

    //send a message
    final newMessage = Message(
        senderId: currUserId,
        senderEmail: currUserEmail!,
        receiverId: receiverId,
        message: message,
        timestamp: timestamp);

    //construct chat room id for the two users
    List<String> ids = [currUserId, receiverId];
    ids.sort();
    String chatroomId = ids.join('-');

    //add msg to database
    await firestore
        .collection('chatRoom')
        .doc(chatroomId)
        .collection("messages")
        .add(newMessage.toMap());
  }

  //get message
  Stream<QuerySnapshot> getMessages(String userId, otherId) {
    //construct a chatroom id for the two users
    List<String> ids = [userId, otherId];
    ids.sort();
    String chatroomId = ids.join('-');

    return firestore
        .collection("chatRoom")
        .doc(chatroomId)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
