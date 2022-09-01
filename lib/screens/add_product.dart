import 'package:flutter/material.dart';
import 'package:toko_online/datas/model/product_model.dart';
import 'package:toko_online/datas/repository/product_repository.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Repository repository = Repository();

    // GlobalKey dapat dimanfaatkan untuk menyimpan state dari suatu widget agar saat
    // elemen tersebut dipindahkan ke suatu lokasi di widget tree, state miliknya tidak hilang.
    final _addFormKey = GlobalKey<FormState>();
    TextEditingController _nameController = TextEditingController();
    TextEditingController _descriptionController = TextEditingController();
    TextEditingController _priceController = TextEditingController();
    TextEditingController _imageUrlController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Name"),
                ),
                controller: _nameController,
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukan Deskripsi product';
                  }
                  return null;
                },
                onChanged: (_) {},
                controller: _descriptionController,
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Price"),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukan Harga product';
                  }
                  return null;
                },
                onChanged: (_) {},
                controller: _priceController,
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Image Url"),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukan Gambar product';
                  }
                  return null;
                },
                onChanged: (_) {},
                controller: _imageUrlController,
              ),
              ElevatedButton(
                onPressed: () {
                  // fungsi untuk validasi jika semua form telah diisi
                  // sesuai dengan validator(jika return true dan tidak error)
                  if (_addFormKey.currentState!.validate()) {
                    _addFormKey.currentState!.save();
                    repository.postProduct(
                      ProductElement(
                          name: _nameController.text,
                          description: _descriptionController.text,
                          price: _priceController.text,
                          imageUrl: _imageUrlController.text),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Succes add Data'),
                      backgroundColor: Colors.amber,
                    ));
                    Navigator.pop(context);
                  }
                },
                child: Text("Save"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
