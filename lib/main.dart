import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:home_finder_new/constants/theme.dart';
import 'package:home_finder_new/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:home_finder_new/firebase_helper/firebase_options/firebase_options.dart';
import 'package:home_finder_new/provider/app_provider.dart';
import 'package:home_finder_new/screens/Home/home.dart';
import 'package:home_finder_new/screens/auth_ui/welcome/welcome.dart';
import 'package:home_finder_new/screens/custom_bottom_bar/custom_bottom_bar.dart';
import 'package:home_finder_new/screens/splash_screen/splashscreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
  // runApp(Splash());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AppProvider(),
        child: MaterialApp(
          title: 'Home Finder',
          theme: themeData,
          home: SplashScreen(),
          /* StreamBuilder(
        stream: FirebaseAuthHelper.instance.getAuthChange,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Home();
          }
          return Welcome();
        },
      ), */
          // home: const MyHomePage(title: 'My Home Finding'),
          debugShowCheckedModeBanner: false,
        ));
  }
}

class InitHome extends StatelessWidget {
  @override
  Widget build(Object context) {
    return StreamBuilder(
      stream: FirebaseAuthHelper.instance.getAuthChange,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // return Home();
          return CustomBottomBar();
        }
        return Welcome();
      },
    );
  }
}
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//           // Here we take the value from the MyHomePage object that was created by
//           // the App.build method, and use it to set our appbar title.
//           title: Text(widget.title),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Welcome'),
//             Image.asset(
//               'assets/images/welcome.png',
//               height: 200,
//               width: 200,
//             )
//           ],
//         ));
//   }
// }
