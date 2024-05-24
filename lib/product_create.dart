import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_about_me/config.dart';

class ProductCreate extends StatefulWidget {
  const ProductCreate({super.key});

  @override
  State<ProductCreate> createState() => _ProductCreateState();
}

class _ProductCreateState extends State<ProductCreate> {
  final dio = Dio();
  final baseApi = "${Config.profileData['productAPI']}/create/";

  Future<dynamic> productCreate() async{
    if(projectName.text == '' || projectCover.text == '' || projectDescription.text == '' || projectPrice.text == ''){
      setState(() {
        msg = "กรุณากรอกข้อมูลให้ครบถ้วน";
      });
      return false;
    }
    try {
      var data = json.encode({
        "product_name": projectName.text,
        "product_cover": projectCover.text,
        "product_description": projectDescription.text,
        "product_price": projectPrice.text,
        "product_owner": projectOwner
      });
      await dio.request(baseApi, 
      data: data,
      options: Options(
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
      })).then((response){
        Navigator.pushNamed(context, "product");
      });
    } catch (e) {
      setState(() {
        msg = "เกิดข้อผิดพลาด ไม่สามารถทำรายการได้ $e";
      });
    }
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
        title: const Text("เพิ่มสินค้า"),
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
                      productCreate();
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