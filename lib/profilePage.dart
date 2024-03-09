import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  String title;
  Map<String, dynamic> data;
  String? dataStr;
  Profile({super.key, required this.title, required this.data}) {
    dataStr = data.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 16.0),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image(
                      image: AssetImage(
                          'assets/images/${data["pic"] ?? 'user.png'}'),
                      width: 100.0,
                      height: 100.0),
                ),
                const SizedBox(height: 8.0),
                Text(
                  data["name"] ?? 'N/A',
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  data["sub"] ?? 'N/A',
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: const Text(
                    'โทร',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(data["phone"] ?? 'N/A'),
                ),
                ListTile(
                  leading: const Icon(Icons.mail),
                  title: const Text(
                    'อีเมล',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(data["email"] ?? 'N/A'),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(dataStr ?? ''),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
