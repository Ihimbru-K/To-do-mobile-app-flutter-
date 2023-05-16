import 'package:flutter/material.dart';

import '../colors/colors.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),

        ),
        tileColor: Colors.white,
        leading: Icon(Icons.check_box, color: tdBlue ,),
          title: Text("Check Gmail", style: TextStyle(color: tdBlack, decoration: TextDecoration.lineThrough),),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color:tdRed,
                borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(onPressed: () {  }, icon: null,
            color: Colors.white,
            icon

          ),



        ),

      ),
    );
  }
}
