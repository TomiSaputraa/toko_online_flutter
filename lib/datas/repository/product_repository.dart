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
  Future<Product> postProduct(
    String name,
    String description,
    String price,
    String imageUrl,
  ) async {
    // Sebelumnya saya error disini karena tidak mendefinisikan
    // tipe data dari value yang akan di gunakan

    var response = await post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Charset': 'utf-8',
      },
      body: json.encode({
        'name': name,
        'description': description,
        'price': price,
        'imageUrl': imageUrl,
      }),
    );
    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to post data");
    }
  }
}
