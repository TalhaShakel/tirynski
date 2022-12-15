import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

void main() async {
  runApp(MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  var img;

  MyApp({super.key});
  List l = [
    "https://firebasestorage.googleapis.com/v0/b/tirynski-d9a08.appspot.com/o/Q0003-DUT%20-%20Vanessa%20J%20-%20Giving%20everything%204x2_WallP.jpg?alt=media&token=9f4c1409-703f-4cad-8eb1-f92d497fe546",
    "https://thumbs.dreamstime.com/b/clifton-beach-karachi-pakistan-one-most-beautiful-places-where-people-can-ride-camels-eat-corn-drive-84244139.jpg"
  ];

  setwal(context, path) async {
    int location = WallpaperManager.BOTH_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(path);
    bool result =
        await WallpaperManager.setWallpaperFromFile(file.path, location);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green,
          textTheme: TextTheme(bodyText2: TextStyle(fontSize: 30))),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Wallpaper App'),
          centerTitle: true,
          leading: IconButton(
              onPressed: () async {
                try {
                  EasyLoading.show();

                  await setwal(context, img);
                  EasyLoading.dismiss();
                } catch (e) {
                  EasyLoading.dismiss();
                  Get.snackbar("${e}", "");
                  print("$e");
                }
              },
              icon: Icon(Icons.menu)),
        ),
        body: //Image.asset('images/wallpaper1.jpg')

            ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: l.length,
          itemBuilder: (context, index) {
            img = l[index];
            return Container(
              margin: EdgeInsets.all(10),
              child: InkWell(
                
                onTap: () {
                  setwal(context, l[index]);
                },
                child: 
                Ink.image(
                    image: NetworkImage(l[index]),
                    width: MediaQuery.of(context).size.width - 20,
                    fit: BoxFit.cover),
                    
              ),
            );
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}


//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Column(
//           children: [
//             SizedBox(
//               height: 50,
//             ),
//             Image.network(
//               l[0],
//               fit: BoxFit.fitHeight,
//             ),
//             FloatingActionButton(
//                 onPressed: () async {
//                   int location = WallpaperManager.BOTH_SCREEN;
//                   var file = await DefaultCacheManager().getSingleFile(l[0]);
//                   bool result = await WallpaperManager.setWallpaperFromFile(
//                       file.path, location);
//                 },
//                 child: SizedBox(height: 30, child: Icon(Icons.wallpaper)))
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
