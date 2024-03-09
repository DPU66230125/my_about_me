import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('โปรไฟล์'),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 16.0),
                Image(image: AssetImage('assets/images/user.png'), width: 100.0, height: 100.0),
                SizedBox(height: 8.0),
                Text(
                  'Tummanoon Wanchaem',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'Homo Sapien',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 16.0,),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text(
                    'โทร',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  subtitle: Text('0927934612'),
                ),
                ListTile(
                  leading: Icon(Icons.mail),
                  title: Text(
                    'อีเมล',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  subtitle: Text('tummanoonw1997@gmail.com'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}