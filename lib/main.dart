import 'package:flutter/material.dart';
import 'package:sqlite_pdf/screens/my-ceps.screen.dart';
import 'package:sqlite_pdf/screens/search.screen.dart';
import 'package:sqlite_pdf/screens/splash.screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/myceps' : (_) => MyCepsScreen(),
        '/search' : (_) => SearchScreen()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Color.fromRGBO(10, 10, 50, 1.0),
        primarySwatch: MaterialColor(Color.fromRGBO(10, 10, 50, 1.0).value, {
          50 : Color.fromRGBO(10, 10, 250, 1.0),
          100 : Color.fromRGBO(10, 10, 220, 1.0),
          200 : Color.fromRGBO(10, 10, 190, 1.0),
          300 : Color.fromRGBO(10, 10, 160, 1.0),
          400 : Color.fromRGBO(10, 10, 130, 1.0),
          500 : Color.fromRGBO(10, 10, 100, 1.0),
          600 : Color.fromRGBO(10, 10, 70, 1.0),
          700 : Color.fromRGBO(10, 10, 50, 1.0),
          800 : Color.fromRGBO(10, 10, 30, 1.0),
          900 : Color.fromRGBO(10, 10, 20, 1.0),
        }),
        //hoverColor: Color.fromRGBO(10, 10, 130, 1.0),
        highlightColor: Color.fromRGBO(10, 10, 130, 1.0),
        splashColor: Color.fromRGBO(10, 10, 190, 1.0),
        hoverColor: Color.fromRGBO(10, 10, 130, 1.0),
        focusColor: Color.fromRGBO(10, 10, 130, 1.0),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      home: SplashScreen(),
    );
  }
}
