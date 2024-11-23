import 'package:flutter/material.dart';
import 'package:jadwalku/pages/BuatTugasPage.dart';
import 'package:jadwalku/pages/DashboardPage.dart';
import 'package:jadwalku/pages/ListJadwalPage.dart';
import 'package:jadwalku/pages/LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTS Mobile Programming',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login', // Halaman awal
      routes: {
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => DashboardPage(),
        '/list-jadwal': (context) => ListJadwalPage(),
        '/buat-tugas': (context) => BuatTugasPage(),
      },
    );
  }
}