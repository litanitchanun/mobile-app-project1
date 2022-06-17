import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:project1/nameEntering.dart';
import 'dart:convert';
import 'colors.dart';

class WheelPage extends StatefulWidget {// the page that the wheel is spinning
  final nameController;
  const WheelPage({required this.nameController});
  static var result;





  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<WheelPage>{
  StreamController<int> selected = StreamController<int>();
  final StreamController<int> _controller = StreamController.broadcast();

  // TextEditingController nameEntering = TextEditingController();

  @override
  void dispose(){
    selected.close();
    super.dispose();
  }

  List? convert(String input) { //convert from "name1 name2 name3 ..." to ["name1","name2","name3",....]
    List output;
    try {
      output = json.decode(input);
      return output;
    } catch (err) {
      print('The input is not a string representation of a list');
      return null;
    }
  }

  List? removing(List<String> input, String toRemove){ // to remove the name from wheel
    var index = input.indexOf(toRemove);
    input.removeAt(index);
  }

  @override
  void initState() { // to retrieve the name that is selected from the wheel
    _controller.stream.listen((value) {
      print('Value from controller: $value');
    });
  }


  @override
  Widget build(BuildContext context){
    var keep = widget.nameController;
    var split = (keep.split(' '));
    var theChosen = '';
    List<String> item = [];
    for (var each in split)
      item.add(each);


    // var keep = widget.nameController;
    // var decondKeep = json.decode(keep);
    // final item = decondKeep;

    // final item = <String>[
    //
    // ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Fortune Wheel"),
        backgroundColor: blue,
      ),
      body: GestureDetector(
        onTap: (){
          setState(() {
            selected.add(
              Random().nextInt(item.length),
            );
          });
        },
        child: Column(
          children: [
            Expanded(
              child: FortuneWheel(
                onFling: (){
                  initState();
                  // selected.stream.listen((value) {
                  //   item.indexOf(value.toString());
                  //   var keeping = item;
                  //   item = removing(keeping, $value);
                  // });



                  // selected.stream.listen((value) {
                  //   keep = removing(item, value);
                  // });

                },
                items: [
                  for(var items in item)
                    FortuneItem(
                      child: Text(items),
                    ),
                ],
                selected: selected.stream,
                indicators: <FortuneIndicator>[
                  FortuneIndicator(
                    alignment: Alignment.topCenter, // <-- changing the position of the indicator
                    child: TriangleIndicator(
                      color: purple, // <-- changing the color of the indicator
                    ),
                  ),
                ],

              ),
            ),
          ],
        ),

      ),
    );
  }
}

//Reference: https://youtu.be/lP026rVIrfg