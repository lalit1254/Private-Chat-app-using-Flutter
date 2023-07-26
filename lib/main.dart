import 'package:chat_ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat UI',
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
       // accentColor: Color(0xFFFEF9EB),
        
      ),
      home: HomeScreen(),
    );
  }
}