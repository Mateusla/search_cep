import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool init = false;

  void esperando(){
    Timer(Duration(milliseconds: 10), (){
      setState(() {
        init = true;
      });
      Timer(Duration(seconds: 3), (){
        Navigator.pushNamedAndRemoveUntil(
          context, '/search',
          (_) => false
        );
      });
    });
  }

  @override
  void initState() {
    super.initState();

    esperando();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: !init ? 0 : 1,
          duration: Duration(seconds: 2),
          child: Text(
            'Bem-vindo(a) ao Search Cep',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          )
        ),
      ),
    );
  }
}
