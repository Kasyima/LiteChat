import 'package:cloud_firestore/cloud_firestore.dart';
import 'message.dart';

//! Adding  a data access object
// gets an instance of FirebaseFirestore and then gets
// the root of the messages collection by calling collection().
class MessageDao {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('messages');
  //! saveMessage
  // It takes a Message as a parameter and uses your CollectionReference
  // to save the JSON message to your Cloud Firestore.
  // toJson() --- converts the msg to a JSON String.
  // add() --- Adds the string to the collection.
  void saveMessage(Message message) {
    collection.add(
      message.toJson(),
    );
  }

  //! getMessageStream
  // For retrieval , u only need to expose a Stream<QuerySnapshot>
  // which interacts directly with your DatabaseReference.
  Stream<QuerySnapshot> getMessageStream() {
    return collection.snapshots();
  }
}
