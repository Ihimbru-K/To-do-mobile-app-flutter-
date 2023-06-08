class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,   // id and todo text are required
    this.isDone = false,
});

  static List<ToDo> todoList(){ // a list which returns todo items
    return [
      ToDo(id: "1", todoText: "Work on signup tool", isDone : true),
      ToDo(id: "2", todoText: "Work on API", isDone : true),
      ToDo(id: "3", todoText: "Meditate", isDone : true),
      ToDo(id: "4", todoText: ""),
      ToDo(id: "5", todoText: "House chores",),
      ToDo(id: "6", todoText: "Complete office tasks",),
      ToDo(id: "7", todoText: "movie",),

    ];
  }


}