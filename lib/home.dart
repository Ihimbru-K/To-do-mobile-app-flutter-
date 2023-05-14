import 'package:flutter/material.dart';

import 'colors/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tdBgcolor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.menu, color: tdBlack, size: 30,),
            Container(height: 40, width: 40, child: ClipRRect(borderRadius: BorderRadius.circular(20), child : Image.asset('assets/images/kboy.jpg')),)
          ],
        ),
      ),

      body: ,

    );
  }
}