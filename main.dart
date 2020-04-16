import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main(){
  runApp(MyApp());   //runApp draws the widget on screen 
}

//void main() => runApp(MyApp());  //short hand

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{ //points to MyApp
  var _questionIndex = 0;     // _ makes the class var private; can used only inside this file ?????

  void _answerQuestion(){
    setState(() {          //setState updates widget by calling build
      _questionIndex ++ ; 
      print(_questionIndex);
      if(_questionIndex==3){
        _questionIndex = 0;
        print('test02');
      }  //witout setstate, flutter wont recall build again
    });
    //print(_questionIndex);
  }
  @override                   //override existing statelesswidget by our implementations
  Widget build(BuildContext context){    //flutter always call build method
    var questions = [
      //'Here is the question #1?',
      //'Here is the question #2?',
      //'Here is the question #3?',
      {'questionText':'Here is the question #1',                      //map data structure:similar to dictionary
      'answers':['Answer 01','Answer 02','Answer 03','Answer 04'],
      },
      {'questionText':'Here is the question #2?',
      'answers':['Answer 01','Answer 02','Answer 03','Answer 04'],
      },
      {'questionText':'Here is the question #3?',
      'answers':['Answer 01','Answer 02','Answer 03','Answer 04'],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("App01"),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer){    //as List used to tell 'map' this is a list
              return Answer(_answerQuestion, answer);        //line abv; mapping a list to a list of widgets
            }).toList()              //map questons list in to list of widgets and append to children:
          ],
        ),
      ),
    );
  }
}

//one widget per file ; std