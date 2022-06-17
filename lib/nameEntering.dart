import 'package:flutter/material.dart';
import 'package:project1/colors.dart';
import 'package:project1/fortuneWheel.dart';

class InsertNamePage extends StatelessWidget{ //the page that let user to insert name to be on the wheel
  static var allNames;
  @override
  Widget build(BuildContext context){
    final nameController = new TextEditingController();
      return Scaffold(
        appBar: AppBar(
          title: Text("INSERT YOUR NAME BELOW"),
          backgroundColor: blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: 'name1 name2 name3 name4 name5',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('will insert all names to the wheel');
            allNames = nameController.text;
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      WheelPage(nameController: allNames),
                      // WheelPage.result
                )
            );
          },
          tooltip: 'INSERT NAME',
          child: const Icon(Icons.text_fields),
          backgroundColor: purple,
        ),
      );
  }
}