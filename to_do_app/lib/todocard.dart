import 'package:flutter/material.dart';
import 'todo.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoCard extends StatefulWidget {

  final Todo todo;
  final Function delete;
  TodoCard({this.todo, this.delete});

  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {

  @override
  Widget build(BuildContext context) { 
    return Slidable(
        delegate: SlidableDrawerDelegate(),
        actionExtentRatio: 0.25,
        child: Card(
            //olor: Colors.pink.withOpacity(0.02),
            elevation: 0,
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    InkWell(
                        child: Checkbox(
                          activeColor: Colors.pink[100],
                          value: widget.todo.isDone, 
                          onChanged: (bool value) {
                            setState((){
                              widget.todo.isDone = value;
                            });
                          }
                        ),
                    ),
                    AnimatedDefaultTextStyle(
                      style: widget.todo.isDone 
                      ? TextStyle(
                          decoration: TextDecoration.lineThrough,
                        )
                        : TextStyle(),
                      duration: const Duration(milliseconds: 10),
                      child: Text(
                        widget.todo.item,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ],
                ),
                // Divider(
                //   height: 10.0,
                //   color: Colors.grey[300],
                // ),
              ],
            ),
      ),
    secondaryActions: <Widget>[
    new IconSlideAction(
      caption: 'Delete',
      color: Colors.white,
      icon: Icons.delete,
      onTap: widget.delete,
    ),
  ],
    
    ); 
  }
}