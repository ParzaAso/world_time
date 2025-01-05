import 'dart:io';

import 'package:flutter/material.dart';
import 'pages/choose_location.dart';
import 'pages/home.dart';
import 'pages/loading.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();

  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/location': (context) => const ChooseLocation()
    },
  ));
}

 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}