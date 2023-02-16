import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';
import 'package:cosmopolitan/screens/dashboard/dashboard.dart';
import 'package:cosmopolitan/screens/login_screen/login_screen.dart';
import 'package:cosmopolitan/screens/splash_screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

late final SharedPreferences prefs;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(
      ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) => MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home:  const MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}
class _MyApp extends State<MyApp> {
  @override
  void initState(){
  }
  Widget build(BuildContext context) {

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: prefs.getBool('loggedIn') != true
          ? '/SignIn': '/DashBoard',
      // initialRoute: '/' ,
      routes: {
        '/SignIn': (context) => const LoginScreen(),
        '/DashBoard': (context) =>const Dashboard(),
      },
    );
  }
}
