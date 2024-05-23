import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_about_me/product_create.dart';
import 'package:my_about_me/product_detail.dart';
import 'package:my_about_me/product_update.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final dio = Dio();
  final baseApi =
      "https://testpos.trainingzenter.com/lab_dpu/product/list/66230125?format=json";

  final baseApi2 = "https://testpos.trainingzenter.com/lab_dpu/product/update/";
  late List productList = [];

  Future<void> getProducts() async {
    try {
      await dio
          .get(baseApi,
              options: Options(
                headers: {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json',
                },
              ))
          .then((value) => {
                if (value.statusCode == 200)
                  {
                    setState(() {
                      productList = value.data;
                    })
                  }
              });
    } catch (e) {
      if (!context.mounted) return;
    }
  }

  Future<void> deleteProduct(int index) async {
    try {
      await dio
          .request(baseApi2 + productList[index]["product_id"].toString(),
              options: Options(
                method: 'DELETE',
              ))
          .then((response) {
            
        if (response.statusCode == 204) {
          productList.removeAt(index);
          print(productList);
          setState(() {
            
          });
        }
      });
    } catch (e) {
      if (!context.mounted) return;
    }
  }

  Future<void> alertDelete(int index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ลบข้อมูล'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('ลบข้อมูล ${productList[index]["product_name"]}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ปิด'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('ตกลง'),
              onPressed: () {
                ///DELETE HERE
                deleteProduct(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void createProduct() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const ProductCreate()));
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("สินค้าของฉัน"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                      onPressed: () {
                        createProduct();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(25, 210, 25, 1)),
                      child: const Text(
                        '+ เพิ่มสินค้า',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8.00),
                  itemCount: productList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      child: Column(children: [
                        Image.network(productList[index]["product_cover"]),
                        ListTile(
                          //leading: const Icon(Icons.arrow_drop_down_circle),
                          title: Text(productList[index]["product_name"]),
                          subtitle:
                              Text(productList[index]["product_description"]),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "วันที่ลงสินค้า ${productList[index]["update_date"]}",
                              style: const TextStyle(color: Colors.blueGrey),
                            ),
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  alertDelete(index);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(250, 10, 10, 1)),
                                child: const Text(
                                  'ลบ',
                                  style: TextStyle(color: Colors.white),
                                )),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProductUpdate(
                                              productId: productList[index]
                                                      ["product_id"]
                                                  .toString())));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(177, 200, 0, 1)),
                                child: const Text(
                                  'แก้ไข',
                                  style: TextStyle(color: Colors.white),
                                )),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProductDetail(product: productList[index],)));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(25, 177, 252, 1)),
                                child: const Text(
                                  'รายละเอียด',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ],
                        )
                      ]),
                    );
                  }),
            )
          ],
        ));
  }
}
