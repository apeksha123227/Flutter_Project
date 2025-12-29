class Model {
  int? id;
  String? name;
  int? age;

  Model({this.id, required this.name, required this.age});

  Map<String, dynamic> tomap() {
    return {'id': id, 'name': name, 'age': age};
  }

  factory Model.fromMap(Map<String, dynamic> map) {
    return Model(
      id: map['id'],
      name: map['name'],
      age: map['age'],
    );
  }
}
