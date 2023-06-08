import 'package:flutter/material.dart';

import '../Widgets/todo_item.dart';
import '../constants/colors.dart';
import '../model/ToDo.dart';

class Home extends StatefulWidget {
  //Home(Key? key) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  get todoList => null;
  final _todoController = TextEditingController();  // to be able to edit todo items

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  //final todoList = ToDo.todoList();
  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: tdBgcolor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,
          ),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/kboy.jpg')),
          )
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
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                    child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: 50,
                        bottom: 20,
                      ),
                      child: Text(
                        'All ToDos',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                    ),
                    for (ToDo todoo in _foundToDo.reversed)

                      /**first todo below is the one we are expecting from the list
                       * second todo is from the widget expecting to do items
                       */
                      ToDoItem(
                        todo: todoo,
                        onToDoChanged: _handleToDoChange,
                        onDeleteItem: _deleteToDoItem,
                      ), //passing todo items to the todo widget
                  ],
                ))
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0),
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _todoController,

                  decoration: InputDecoration(
                    hintText: 'Add new todo item',
                    border: InputBorder.none,
                  ),
                ),
              )),
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  child: Text(
                    "+",
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tdBlue,
                    minimumSize: const Size(60, 60),
                    elevation: 10,
                  ),
                  onPressed: () {
                    _addToDoItem(_todoController.text);
                  },
                ),
              )
            ]),
          )
        ],
      ), // Stack widget will contain everything on the screen
    );
  }

  void _handleToDoChange(ToDo toDo){
    setState((){
    toDo.isDone = !toDo.isDone;});
  }

void  _deleteToDoItem(String id){
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });

}

void _addToDoItem(toDo){
    setState(() {
      todosList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText: toDo,));


    });
    _todoController.clear();
}

void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if( enteredKeyword.isEmpty){   // if there's a blank space it displays all todos
      results = todosList;
    }else {

      results = todosList.where((item) => item.todoText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
   setState(() {
     _foundToDo = results;
   });
    }
}

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(Icons.search, color: tdBlack, size: 20),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              minWidth: 25,
            ),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: tdGrey)),
      ),
    );
  }
}

