import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../model/ToDo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;  // created todo variable  of type todo
  ToDoItem({Key? key, required this.todo}) : super(key: key);


  final todoList = ToDo.todoList();

  @override
  Widget build(BuildContext context) {
    return
      Container(
      margin: EdgeInsets.only(bottom: 20), // spacing at the bottom
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 25), //padding for everything in the list tile
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),

        ),
        tileColor: Colors.white,

        // The check icon is outlined with checkbox if and only if task is completed, otherwise it stays blank
        leading: Icon(todo.isDone? Icons.check_box : Icons.check_box_outline_blank, color: tdBlue ,),

        //There will be a line that will cross the text if the todo item is done

          title: Text(todo.todoText!, style: TextStyle(color: tdBlack, decoration: todo.isDone? TextDecoration.lineThrough : null),),
        trailing: Container(
          padding: EdgeInsets.all(0),           //this is the container that contains the delete icon
          margin:  EdgeInsets.all(12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color:tdRed,
                borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            icon: Icon(Icons.delete),     //This is the delete button, once pressed it deletes a task
            color: Colors.white,
            iconSize: 18, onPressed: () { print("clicked on delete icon"); },

          ),



        ),

      ),
    );
  }
}
