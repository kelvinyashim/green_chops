import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  //first we get the instance of firestore
  final firestore = FirebaseFirestore.instance;

  //now we get the user stream to display the users
  Stream<List<Map<String, dynamic>>> getuserStream() {
    return firestore.collection('user').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }
  //the first line allows us to iterate over the snapshots
  //the snapshot listen for changes and the map is used to modify the data within the sshot
  //the snapshot parameter gives us an instance of a single data within the stream
  //
}
//Now we build a list of the users so we can display them