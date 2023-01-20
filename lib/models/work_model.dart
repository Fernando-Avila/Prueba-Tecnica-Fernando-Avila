import 'package:cloud_firestore/cloud_firestore.dart';

class Work {
  String id;
  String descripcion;
  bool active;
  bool completed;
  Timestamp updated_at;
  Timestamp created_at;
  dynamic image;
  double coorx;
  double coory;
  Work({
    required this.id,
    required this.descripcion,
    required this.active,
    required this.completed,
    required this.updated_at,
    required this.created_at,
    required this.image,
    required this.coorx,
    required this.coory,
  });
  Map<String, Object> toMap() {
    return {
      'descripcion': descripcion,
      'active': active,
      'completed': completed,
      'updated_at': updated_at,
      'created_at': created_at,
      'image': image,
      'coorx': coorx,
      'coory': coory
    };
  }

  static fromMap(data, id) {
    return Work(
      id: id,
      descripcion: data['descripcion'],
      active: data['active'],
      completed: data['completed'],
      updated_at: data['updated_at'],
      created_at: data['created_at'],
      image: data['image'],
      coorx: data['coorx'].toDouble(),
      coory: data['coory'].toDouble(),
    );
  }
}
