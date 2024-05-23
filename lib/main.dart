import 'package:flutter/material.dart';
import 'package:my_about_me/blog.dart';
import 'package:my_about_me/config.dart';
import 'package:my_about_me/homePage.dart';
import 'package:my_about_me/login.dart';
import 'package:my_about_me/myAge.dart';
import 'package:my_about_me/myMap.dart';
import 'package:my_about_me/product_list.dart';
import 'package:my_about_me/profilePage.dart';
import 'package:my_about_me/videoPresentation.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'My About Me'),
      routes: <String, WidgetBuilder>{
        'profile': (BuildContext context) => Profile(
              title: 'โปรไฟล์',
              data: Config.profileData,
            ),
        'video_presentation': (BuildContext context) => const VideoPresentation(),
        'my_map': (BuildContext context) => const MyMap(),
        'my_age':(BuildContext context) => const MyAge(),
        'blog': (BuildContext context) => const Blog(),
        'product': (BuildContext context) => const ProductList()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int userId = 0;

  @override
  void initState(){
    super.initState();
    checkLogin();
  }

  Future<void> checkLogin() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final int userId = pref.getInt("userAuth")!;
    setState(() {
      this.userId = userId;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body: FutureBuilder<bool>(
      builder: (context, snapshot) {
        if(userId >= 1){
          return const HomePage();
        }else{
          return const Login();
        }
      },
      future: null,
    ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
