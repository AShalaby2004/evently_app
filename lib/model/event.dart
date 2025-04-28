import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  static const String collectionName = 'Events';
  String id;
  String image;
  String title;
  String description;
  String eventName;
  DateTime dateTime;
  String time;
  bool isFavorite;

  Event({
    this.id = '',
    required this.image,
    required this.title,
    required this.description,
    required this.eventName,
    required this.dateTime,
    required this.time,
    this.isFavorite = false,
  });

  Event.formFireStore(Map<String, dynamic> data)
      : this(
          id: data['id'],
          image: data['image'],
          title: data['title'],
          description: data['description'],
          eventName: data['eventName'],
          dateTime: DateTime.fromMillisecondsSinceEpoch(data['dateTime']),
          time: data['time'],
          isFavorite: data['isFavorite'],
        );

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'description': description,
      'eventName': eventName,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'time': time,
      'isFavorite': isFavorite,
    };
  }
}
