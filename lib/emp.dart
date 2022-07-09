import 'dart:convert';

class EmpModel {
  static List<Item> items = [
    // Item(
    //     id: 1,
    //     name: "Ryan",
    //     exp: 5,
    //     status: true,
    //     image:
    //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc"),
  ];
  Item getByID(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final int exp;
  final bool status;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.exp,
      required this.status,
      required this.image});

  Item copyWith({
    int? id,
    String? name,
    int? exp,
    bool? status,
    String? image,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      exp: exp ?? this.exp,
      status: status ?? this.status,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'exp' : exp,
      'status' : status,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      exp: map['exp'],
      status: map['status'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source, dynamic) =>
      Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, exp: $exp, status: $status, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.name == name &&
        other.exp == exp &&
        other.status == status &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        exp.hashCode ^
        status.hashCode ^
        image.hashCode;
  }
}
