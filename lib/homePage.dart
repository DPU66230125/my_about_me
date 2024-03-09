import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('หน้าหลัก'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Welcome to My About Me'),
                    subtitle: Text('WE679'),
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
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    color: const Color.fromRGBO(114, 165, 246, 1),
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
                    color: const Color.fromRGBO(114, 165, 246, 1),
                    child: TextButton(
                      onPressed: () {},
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
                                color: Colors.white),
                          ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    color: const Color.fromRGBO(114, 165, 246, 1),
                    child: TextButton(
                      onPressed: () {},
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
                    color: const Color.fromRGBO(114, 165, 246, 1),
                    child: TextButton(
                      onPressed: () {},
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
