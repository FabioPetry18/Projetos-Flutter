// ignore_for_file: file_names, must_call_super, prefer_collection_literals

import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  const Todo({ Key key }) : super(key: key);

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {

  final _toDoController = TextEditingController();

  List _toDoList = [];
  Map<String, dynamic> _lastRemoved;
  int _lastRemovedPos;


  @override
  void initState(){
    super.initState();

    _readData().then((data){
      setState(() {
         _toDoList = json.decode(data);
      });
     
    });
  }

  void _addToDo() {
   setState(() {
       Map<String, dynamic> newToDo = Map();
      newToDo["title"] = _toDoController.text;
      _toDoController.text = "";
      newToDo["ok"] = false;
      _toDoList.add(newToDo);
      _saveData();
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de tarefas"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
            child: Row(
              children:  [
                 Expanded(child: TextField(
                  controller: _toDoController,
                  decoration: const InputDecoration(
                    labelText: "Tarefa",
                    labelStyle: TextStyle(color: Colors.blueAccent)
                  ),
                ),
                ),
                ElevatedButton(
                  onPressed: _addToDo, 
                  child: const Text("ADD"),
                  style: ElevatedButton.styleFrom(
                   primary: Colors.blueAccent
                  ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10.0),
              itemCount: _toDoList.length,
              itemBuilder: buildItem
              ),
            ),
        ],
      ),
    );
  }
Widget buildItem (context, index){
                return Dismissible(
                  key: Key(DateTime.now().microsecondsSinceEpoch.toString()), 
                  child: CheckboxListTile(
                  title: Text(_toDoList[index]["title"]),
                  value: _toDoList[index]["ok"],
                  secondary: CircleAvatar(
                    child: Icon(_toDoList[index]["ok"] ?
                    Icons.check : Icons.error),
                  ),
                  onChanged: (c){
                    setState(() {
                      _toDoList[index]["ok"] = c;
                      _saveData();
                    });
                  },
                ),
                  background: Container(
                    color: Colors.red,
                    child: const Align(
                      alignment: Alignment(-0.9, 0.0),
                      child: Icon(Icons.delete, color: Colors.white,),
                    ) ,
                  ),
                  direction: DismissDirection.startToEnd,
                  
                  );
              }

  Future<File> _getFile() async {
  final directory = await getApplicationDocumentsDirectory();
  return File("${directory.path}/data.json");
  }

  Future<File> _saveData() async {
    String data = json.encode(_toDoList);
    final file = await _getFile();
    return file.writeAsString(data);
  }
  Future<String> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    }catch (e) {
      return "";
    }
  }
}

