import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
class Data {
  Data({
    required this.message,
    required this.status,
    required this.product,
    required this.username,
  });

  final String message;
  final int status;
  final List<String> product;
  final List<String> username;

  factory Data.fromRawJson(String str) =>
      _$DataFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Product {
  Product({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String name;
  final String description;
  final String price;
  final String imageUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Product.fromRawJson(String str) =>
      _$ProductFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  static fromJson(Map<String, dynamic> e) {}
}

@JsonSerializable()
class Username {
  Username({
    required this.name,
    required this.id,
  });

  final String name;
  final int id;

  factory Username.fromRawJson(String str) =>
      _$UsernameFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$UsernameToJson(this);
}
