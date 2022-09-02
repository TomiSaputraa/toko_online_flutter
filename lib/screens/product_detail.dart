import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toko_online/screens/edit_product_page.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Map product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back),
        ),
        centerTitle: true,
        title: Text("Product Detail"),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2,
            child: Hero(
              tag: product["imageUrl"],
              child: Image(
                image: NetworkImage(product["imageUrl"]),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product["price"],
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Row(children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EditProduct(
                            product: product,
                          ),
                        ),
                      );
                    },
                    child: Icon(Icons.edit)),
                Icon(Icons.delete)
              ])
            ],
          ),
          Text(product["description"])
        ],
      ),
    );
  }
}
