import 'dart:convert';

class Product {
  Product({
    required this.message,
    required this.status,
    required this.product,
    required this.username,
  });

  final String message;
  final int status;
  final List<ProductElement> product;
  final List<Username> username;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        message: json["message"],
        status: json["status"],
        product: List<ProductElement>.from(
            json["product"].map((x) => ProductElement.fromMap(x))),
        username: List<Username>.from(
            json["username"].map((x) => Username.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "status": status,
        "product": List<dynamic>.from(product.map((x) => x.toMap())),
        "username": List<dynamic>.from(username.map((x) => x.toMap())),
      };
}

class ProductElement {
  final int? id; //Tambahkan tanda ? untuk nullable jadi bisa tanpa requiered
  final String name;
  final String description;
  final String price;
  final String imageUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProductElement({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductElement.fromJson(String str) =>
      ProductElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductElement.fromMap(Map<String, dynamic> json) => ProductElement(
        id: json["id"] as int,
        name: json["name"] as String,
        description: json["description"] as String,
        price: json["price"] as String,
        imageUrl: json["image_url"] as String,
        createdAt: DateTime.parse(json["createdAt"] as String),
        updatedAt: DateTime.parse(json["updatedAt"] as String),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "imageUrl": imageUrl,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
  @override
  String toString() {
    return 'ProductElement{id: $id,name: $name,description: $description, price: $price, imageUrl: $imageUrl,createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}

class Username {
  Username({
    required this.name,
    required this.id,
  });

  final String name;
  final int id;

  factory Username.fromJson(String str) => Username.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Username.fromMap(Map<String, dynamic> json) => Username(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "id": id,
      };
}
