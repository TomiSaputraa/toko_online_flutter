import 'package:flutter/material.dart';
import 'package:toko_online/datas/model/product.dart';
import 'package:toko_online/datas/repository/product_repository.dart';
import 'package:toko_online/screens/homepage.dart';

class EditProduct extends StatelessWidget {
  EditProduct({required this.product});
  final Map product;

  @override
  Widget build(BuildContext context) {
    final Repository repository = Repository();

    final _updateFormKey = GlobalKey<FormState>();
    TextEditingController _nameController = TextEditingController();
    TextEditingController _descriptionController = TextEditingController();
    TextEditingController _priceController = TextEditingController();
    TextEditingController _imageUrlController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Product"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _updateFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Name"),
                ),
                // .. merupakan spread operator atau langsung mengasih nilai dari contoh teks dibawah
                // Di Dart, Spread Operator (…) dan Null-aware Spread Operator (…?) digunakan untuk
                // menyisipkan beberapa elemen dalam koleksi seperti List, Map, dll. Sintaks: Operator spread
                controller: _nameController..text = product['name'],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukan Nama product';
                  }
                  return null;
                },
                onChanged: (_) {},
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Description"),
                ),
                controller: _descriptionController
                  ..text = product['description'],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukan Deskripsi product';
                  }
                  return null;
                },
                onChanged: (_) {},
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Price"),
                ),
                controller: _priceController..text = product['price'],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukan Harga product';
                  }
                  return null;
                },
                onChanged: (_) {},
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Image Url"),
                ),
                controller: _imageUrlController..text = product['imageUrl'],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukan Gambar product';
                  }
                  return null;
                },
                onChanged: (_) {},
              ),
              ElevatedButton(
                onPressed: () {
                  if (_updateFormKey.currentState!.validate()) {
                    _updateFormKey.currentState!.save();
                    repository.putProduct(
                      Product(
                          name: _nameController.text,
                          description: _descriptionController.text,
                          price: _priceController.text,
                          imageUrl: _imageUrlController.text),
                      product['id'].toString(),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Succes update Data'),
                        backgroundColor: Colors.amber,
                      ),
                    );
                    Navigator.pop(context, 'refresh');
                  }
                },
                child: Text("Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
