class ContactModelFields {
  static const String id = "_id";
  static const String name = "name";
  static const String surname = 'surname';
  static const String phone = "phone";

  static const String contactsTable = "my_contacts";
}

class ContactModelSql {
  int? id;
  final String name;
  final String surname;
  final String phone;

  ContactModelSql({
    this.id,
    required this.name,
    required this.surname,
    required this.phone,
  });

  ContactModelSql copyWith({
    String? name,
    String? surname,
    String? phone,
    int? id,
  }) {
    return ContactModelSql(
      surname: surname ?? this.surname,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      id: id ?? this.id,
    );
  }

  factory ContactModelSql.fromJson(Map<String, dynamic> json) {
    return ContactModelSql(
      surname: json[ContactModelFields.surname] ?? "",
      name: json[ContactModelFields.name] ?? "",
      phone: json[ContactModelFields.phone] ?? "",
      id: json[ContactModelFields.id] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ContactModelFields.surname: surname,
      ContactModelFields.name: name,
      ContactModelFields.phone: phone,
    };
  }

  @override
  String toString() {
    return '''
      name: $name
      surname: $surname
      phone: $phone
      id: $id, 
    ''';
  }
}