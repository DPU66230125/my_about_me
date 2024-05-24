import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_about_me/config.dart';

class ProductUpdate extends StatefulWidget {
  const ProductUpdate({super.key, required this.productId});

  final String productId;

  @override
  State<ProductUpdate> createState() => _ProductUpdateState();
}

class _ProductUpdateState extends State<ProductUpdate> {
  final dio = Dio();
  final baseApi = "${Config.profileData['productAPI']}/update/";

  Future<void> getSingleProduct() async{
    try {
      await dio.get(
        baseApi + widget.productId, 
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        })
      ).then((response){
        if(response.statusCode == 200){
          setState(() {
            projectName.text = response.data["product_name"];
            projectCover.text = response.data["product_cover"];
            projectDescription.text = response.data["product_description"];
            projectPrice.text = response.data["product_price"];
          });
        }
      });
    } catch (e) {
      if(!context.mounted) return;
    }
  }

  Future<dynamic> productUpdate() async{
    if(projectName.text == '' || projectCover.text == '' || projectDescription.text == '' || projectPrice.text == ''){
      setState(() {
        msg = "กรุณากรอกข้อมูลให้ครบถ้วน";
      });
      return false;
    }
    try {
      await dio.put(baseApi + widget.productId, 
      data: {
        "product_name": projectName.text,
        "product_cover": projectCover.text,
        "product_description": projectDescription.text,
        "product_price": projectPrice.text,
        "product_owner": projectOwner
      },
      options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
      })).then((response){
        Navigator.pushNamed(context, "product");
      });
    } catch (e) {
      setState(() {
        msg = "เกิดข้อผิดพลาด ไม่สามารถทำรายการได้";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getSingleProduct();
  }


  final projectName = TextEditingController();
  final projectCover = TextEditingController();
  final projectDescription = TextEditingController();
  final projectPrice = TextEditingController();

  late String projectOwner = "66230125";
  late String msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("แก้ไขสินค้า"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: projectName,
              readOnly: false,
              decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.info_outline_rounded),
                  labelText: "ชื่อสินค้า"),
              onTap: () async {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: projectCover,
              readOnly: false,
              decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.image_outlined),
                  labelText: "URL รูปสินค้า"),
              onTap: () async {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: projectDescription,
              readOnly: false,
              decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.description_outlined),
                  labelText: "รายละเอียดสินค้า"),
              onTap: () async {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: projectPrice,
              readOnly: false,
              decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.monetization_on_outlined), labelText: "ราคา"),
              onTap: () async {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: TextButton(
                    onPressed: () {
                      productUpdate();
                    }, 
                    /*style: TextButton.styleFrom(
                      foregroundColor: Colors.red
                    ),*/
                    child: const Text("บันทึกข้อมูล", style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold
                    ),)
                  )
                ),
          ),
          if (msg != "")
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(msg, style: const TextStyle(color: Colors.red),)
                ),
          )
        ],
      ),
    );
  }
}
