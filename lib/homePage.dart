import 'package:flutter/material.dart';
import 'package:my_about_me/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<void> logOut() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('หน้าหลัก'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Welcome to My About Me'),
                    subtitle: Text('WE679'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Icon(Icons.logout),
                        onPressed:() => {
                          logOut(),
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => const Login()))
                        }, 
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                children: [
                  ///color pallete https://coolors.co/palette/01befe-ffdd00-ff7d00-ff006d-adff02-8f00ff
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    color: const Color.fromRGBO(1, 190, 254, 1),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'profile');
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/images/user.png'),
                            width: 80.0,
                            height: 80.0,
                          ),
                          SizedBox(height: 8.0),
                          Center(
                              child: Text(
                            'โปรไฟล์',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    color: const Color.fromRGBO(255, 221, 0, 1),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "video_presentation");
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/images/multimedia.png'),
                            width: 80.0,
                            height: 80.0,
                          ),
                          SizedBox(height: 8.0),
                          Center(
                              child: Text(
                            'วิดีโอแนะนำ',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    color: const Color.fromRGBO(255, 125, 0, 1),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "my_map");
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/images/map.png'),
                            width: 80.0,
                            height: 80.0,
                          ),
                          SizedBox(height: 8.0),
                          Center(
                              child: Text(
                            'แผนที่',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    color: const Color.fromRGBO(255, 0, 109, 1),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "my_age");
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/images/schedule.png'),
                            width: 80.0,
                            height: 80.0,
                          ),
                          SizedBox(height: 8.0),
                          Center(
                              child: Text(
                            'คำนวณอายุ',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    color: const Color.fromRGBO(173, 255, 2, 1),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "blog");
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/images/portfolio.png'),
                            width: 80.0,
                            height: 80.0,
                          ),
                          SizedBox(height: 8.0),
                          Center(
                              child: Text(
                            'บล็อก',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    color: const Color.fromRGBO(143, 0, 255, 1),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "product");
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/images/products.png'),
                            width: 80.0,
                            height: 80.0,
                          ),
                          SizedBox(height: 8.0),
                          Center(
                              child: Text(
                            'สินค้า',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
