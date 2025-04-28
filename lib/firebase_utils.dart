import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/model/event.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseUtils {
  static CollectionReference getEventsCollection() {
    return FirebaseFirestore.instance
        .collection(Event.collectionName)
        .withConverter<Event>(
            fromFirestore: (snapshot, options) =>
                Event.formFireStore(snapshot.data()!),
            toFirestore: (event, options) => event.toFirestore());
  }

  static Future<void> addEventToFireStore(Event event) {
    var eventCollection = getEventsCollection();
    DocumentReference<Event> docRef =
        eventCollection.doc() as DocumentReference<Event>;
    event.id = docRef.id;
    return docRef.set(event);
  }
}
