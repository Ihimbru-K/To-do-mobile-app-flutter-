import 'package:flutter/material.dart';

import 'Widgets/todo_item.dart';
import 'colors/colors.dart';


void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: tdBgcolor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.menu, color: tdBlack, size: 30,),
          Container(height: 40, width: 40, child: ClipRRect(borderRadius: BorderRadius.circular(20), child : Image.asset('assets/images/kboy.jpg')),)
        ],
      ),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tdBgcolor,
        appBar: _buildAppBar(),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child : Column(
          children: [
           searchBox(),
            Expanded(child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 50,
                    bottom: 20,
                  ),
                  child: Text(
                    'All ToDos', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                  ),
                ),
                ToDoItem(),
              ],
            )
            )
          ],
        ))
    );
  }

  Widget searchBox() {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(Icons.search, color: tdBlack, size : 20),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              minWidth: 25,
            ),
            border: InputBorder.none,
            hintText : 'Search',
            hintStyle : TextStyle(color: tdGrey)

        ),

      ),
    );
  }
}