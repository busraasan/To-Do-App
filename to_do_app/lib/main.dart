import 'package:flutter/material.dart';
import 'todo.dart';
import 'todocard.dart';

void main() => runApp(MaterialApp(
  home: Todolist(),
));

class Todolist extends StatefulWidget {
  @override
  _TodolistState createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {

  TextEditingController _controller = new TextEditingController();

  List<Todo> todos = [
    Todo(item: "Finish homework", isDone: false),
    Todo(item: "Go shopping", isDone: false),
    Todo(item: "Read book", isDone: false)
  ];

  Todo removed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              "To-do's",
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
              ),
              ),
          ),
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius:BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
          ),
          backgroundColor: Colors.pink.withOpacity(0.30),
          elevation: 0.0,
          leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Icon(
              Icons.menu,
              color: Colors.white,
              ),
          ),
          onPressed: (){},
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top:10.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "New task...",
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                prefixIcon: Icon(Icons.create),
                suffixIcon: IconButton(
                   icon: Icon(Icons.clear),
                   onPressed: () => _controller.clear()),
              ),
              onSubmitted: (String newtask){
                setState(() {
                  if(newtask.length > 0) {
                    todos.insert(0,Todo(item:newtask, isDone:false));
                    _controller.clear();
                  }
                });
              },
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) => Divider(
                height: 10.0,
                color: Colors.grey[300],
                indent: 20.0,
                endIndent: 20.0,
              ),
              itemCount: todos.length,
              itemBuilder: (context, index){
                return TodoCard(
                  todo: todos[index],
                  delete: () {
                    setState(() {
                      todos.remove(todos[index]);
                    });
                  }
                );
              }
            ),
          ),
        ],
      )
    );
  }
}

          // Column(
          //   children: todos.map((todo) => TodoCard(
          //     todo: todo,
          //     delete: () { 
          //       setState(() {
          //         todos.remove(todo);
          //       });
          //     },
          //   )).toList(),
          // ),   