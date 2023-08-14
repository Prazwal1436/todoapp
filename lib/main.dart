// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "To Do App",
      home: TODOAPP(),
    ));

class TODOAPP extends StatefulWidget {
  const TODOAPP({super.key});

  @override
  State<TODOAPP> createState() => _TODOAPPState();
}

class _TODOAPPState extends State<TODOAPP> {
  late String listvalue;
  var listTODO = [''];
  addToDo(String item) {
    if (item == '') {
      showAlertDialog(context);
    } else {
      setState(() {
        listTODO.add(item);
      });
    }
  }

  _onDeleteItemPressed(int index) {
    listTODO.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Text("TODO APP"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepPurpleAccent,
            child: Icon(Icons.add),
            onPressed: () {
              addToDo(listvalue);
            }),
        body: ListView.builder(
            itemCount: listTODO.length,
            itemBuilder: (context, index) {
              return index == 0
                  ? Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Add Items",
                        ),
                        onChanged: (val) {
                          listvalue = val;
                        },
                      ),
                    )
                  : ListTile(
                      leading: Icon(Icons.task),
                      trailing: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onTap: () {
                        _onDeleteItemPressed(index);
                      },
                      title: Text(
                        '${listTODO[index]}',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ));
            }));
  }
}

class MyAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        child: Text('Please Enter The Items'),
        onPressed: () {
          showAlertDialog(context);
        },
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text("Warning"),
    content: Text("Please Fill The Text."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
