import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toko_online/datas/model/product_model.dart';

class Repository {
  Future getProduct() async {
    List<Product> products = [];

    const apiUrl = 'http://10.0.2.2:8000/api/products';
    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List<dynamic> listData = jsonData['product'];

      print(listData);
      return listData;
    }

    return products;
  }
}
