import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:toko_online/datas/model/product.dart';

class Repository {
  static final String apiUrl =
      'http://10.0.2.2:8000/api/products'; //Url Endpoint API

  // Method untuk membaca data Product
  Future getProduct() async {
    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List<dynamic> listData = jsonData['product'];

      print(listData); // Untuk print data di console
      return listData;
    }
  }

  // Method ini akan membuat product sesuai dengan nama class
  // disini jangan lupa nama class sesuai dengan data yang ingin kita CRUD
  Future<Product?> postProduct(
    Product? product,
  ) async {
    // Sebelumnya saya error disini karena tidak mendefinisikan
    // tipe data dari value yang akan di gunakan
    Map data = <String, String>{
      'name': product!.name,
      'description': product.description,
      'price': product.price,
      'imageUrl': product.imageUrl,
    };

    var response = await post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Charset': 'utf-8',
      },
      body: json.encode(data),
    );
    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to post data");
    }
  }
}
