import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, required this.product});

  final dynamic product;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final dio = Dio();
  final baseApi = "https://testpos.trainingzenter.com/lab_dpu/product/update/";

  /*Future<void> getSingleProduct() async {
    try {
      await dio
          .get(baseApi + widget.productId,
              options: Options(headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
              }))
          .then((response) {
        if (response.statusCode == 200) {
          setState(() {
            productName = response.data["product_name"];
            productCover = response.data["product_cover"];
            productDescription = response.data["product_description"];
            productPrice = response.data["product_price"];
            updateDate = response.data["update_date"];
          });
        }
      });
    } catch (e) {
      if (!context.mounted) return;
    }
  }*/

  late String productName = widget.product["product_name"];
  late String productCover = widget.product["product_cover"];
  late String productDescription = widget.product["product_description"];
  late String productPrice = widget.product["product_price"];
  late String updateDate = widget.product["update_date"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(productName),
      ),
      body: 
      SingleChildScrollView(
        child: Card(
          clipBehavior: Clip.antiAlias,
          color: Colors.white,
          child: Column(children: [
            Image.network(productCover),
            ListTile(
              //leading: const Icon(Icons.arrow_drop_down_circle),
              title: Text(productName),
              subtitle: Text(productDescription),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "วันที่ลงสินค้า ${updateDate}",
                  style: const TextStyle(color: Colors.blueGrey),
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red),
                    child: Text(
                      'ราคา $productPrice.-',
                      style: const TextStyle(
                        color: Colors.yellow,
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                        ),
                    )),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
