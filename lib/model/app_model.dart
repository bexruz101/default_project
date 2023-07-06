

class AppModelFields {
  static const String id = "_id";
  static String name = 'name';
  static String price = 'price';
  static String secondPrice = 'secondPrice';
  static String description = 'description';
  static String photo = 'photo';
  static String count = '0';

  static const String productsTable = "my_products";
}

class AppModelSql {
  int? id;
  final String name;
  final String price;
  final String secondPrice;
  final String description;
  final String photo;
  final String count;

  AppModelSql({
    this.id,
    required this.name,
    required this.count,
    required this.photo,
    required this.secondPrice,
    required this.description,
    required this.price,
  });

  AppModelSql copyWith({
    int? id,
    String? name,
    String? price,
    String? secondPrice,
    String? description,
    String? photo,
    String? count,
  }) {
    return AppModelSql(
        id: id ?? this.id,
        name: name ?? this.name,
        count: count ?? this.count,
        photo: photo ?? this.photo,
        secondPrice: secondPrice ?? this.secondPrice,
        description: description ?? this.description,
        price: price ?? this.price
    );
  }

  factory AppModelSql.fromJson(Map<String, dynamic> json) {
    return AppModelSql(
        id: json[AppModelFields.id] ?? '0',
        name: json[AppModelFields.name] ?? "",
        count: json[AppModelFields.count] ?? 0,
        photo: json[AppModelFields.photo] ?? "",
        secondPrice: json[AppModelFields.secondPrice] ?? "",
        description: json[AppModelFields.description] ?? "",
        price: json[AppModelFields.price] ?? ""
    );
  }

  Map<String, dynamic> toJson() {
    return {
      AppModelFields.name: name,
      AppModelFields.count: count,
      AppModelFields.photo: photo,
      AppModelFields.secondPrice: secondPrice,
      AppModelFields.description: description,
      AppModelFields.price: price,
    };
  }

  @override
  String toString(){
    return '''
      name: $name
      count:$count
      photo:$photo
      secondPrice:$secondPrice
      description:$description
      price:$price
    ''';
  }
}