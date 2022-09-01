// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      message: json['message'] as String,
      status: json['status'] as int,
      product:
          (json['product'] as List<dynamic>).map((e) => e as String).toList(),
      username:
          (json['username'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'product': instance.product,
      'username': instance.username,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int?,
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      imageUrl: json['imageUrl'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

Username _$UsernameFromJson(Map<String, dynamic> json) => Username(
      name: json['name'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$UsernameToJson(Username instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };
