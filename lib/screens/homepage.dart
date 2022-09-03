import 'dart:async';

import 'package:flutter/material.dart';
import 'package:toko_online/datas/repository/product_repository.dart';
import 'package:toko_online/screens/add_product.dart';
import 'package:toko_online/screens/edit_product_page.dart';
import 'package:toko_online/screens/product_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Repository repository = Repository();
  bool _isLoading = true;

  // Function untuk refresh layar jika ada perubahan data
  bool _value = false;
  void changeData() {
    setState(() {
      _value = true;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false; // <-- Code run after delay
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        // function refresh digunakan di navigator yang ingin di refresh setelah ubah data

        onPressed: () async {
          // berikan tipe data nullable agar tidak error
          // karena pop(result) bertipe data null
          String? res = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddProduct()),
          );
          // akan mengambil value pop(result) di layer berikutnya kesini
          if (res == 'refresh') {
            changeData();
          }
        },
        child: Icon(Icons.add),
        splashColor: Colors.amber,
        tooltip: "Tambah produk",
        heroTag: null,
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Rollo Store"),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder(
        future: repository.getProduct(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (_isLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
          } else {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount:
                    snapshot.data.length == null ? null : snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 5,
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) {
                                    return ProductDetail(
                                      product: snapshot.data[index],
                                    );
                                  }),
                                );
                              },
                              child: Hero(
                                tag: snapshot.data[index]['imageUrl'],
                                child: Image.network(
                                    snapshot.data[index]['imageUrl']),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  snapshot.data[index]['name'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                SizedBox(height: 20),
                                Text(snapshot.data[index]['description']),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 30,
                                      child: IconButton(
                                        // method ini akan auto refresh layar
                                        onPressed: () async {
                                          // tambahkan tipe data null agar tidak error saat menekan tombol back
                                          String? refresh =
                                              await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => EditProduct(
                                                product: snapshot.data[index],
                                              ),
                                            ),
                                          );
                                          if (refresh == 'refresh') {
                                            changeData();
                                          }
                                        },
                                        icon: Icon(Icons.edit),
                                        splashRadius: 1,
                                        splashColor: Colors.red,
                                        tooltip: "Edit",
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                    Text("Rp ${snapshot.data[index]['price']}"),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }
          return Center(
              child: CircularProgressIndicator(
            color: Colors.amber,
          ));
        },
      ),
    );
  }
}
