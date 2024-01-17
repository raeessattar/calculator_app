import 'package:calculator_app/constants.dart';
import 'package:calculator_app/round_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var userInput = '';
  var answerOutput = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                      ),
                      Text(userInput.toString(), style: TextStyle(fontSize: 30, color: Colors.white),),
                      SizedBox(height: 10,),
                      Text(answerOutput.toString(), style: TextStyle(fontSize: 30, color: Colors.white),)
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Row(
                      children: [
                        RoundButton(title: 'AC', onPress: (){
                          userInput = '';
                          answerOutput = '';
                          setState(() {});
                          },),
                        RoundButton(title: '+/-', onPress: (){
                          userInput += '+/-';
                          setState(() {});
                        },),
                        RoundButton(title: '%', onPress: (){
                          userInput += '%';
                          setState(() {});
                        },),
                        RoundButton(title: '/', onPress: (){
                          userInput += '/';
                          setState(() {});
                        }, color: Color(0xffffa00a)),
                      ],
                    ),
                    Row(
                      children: [
                        RoundButton(title: '7', onPress: (){
                          userInput += '7';
                          setState(() {});
                          },
                        ),
                        RoundButton(title: '8', onPress: (){
                          userInput += '8';
                          setState(() {});
                        },),
                        RoundButton(title: '9', onPress: (){
                          userInput += '9';
                          setState(() {});
                        },),
                        RoundButton(title: 'x', onPress: (){
                          userInput += 'x';
                          setState(() {});
                        }, color: Color(0xffffa00a)),
                      ],
                    ),
                    Row(
                      children: [
                        RoundButton(title: '4', onPress: (){
                          userInput += '4';
                          setState(() {});
                        },),
                        RoundButton(title: '5', onPress: (){
                          userInput += '5';
                          setState(() {});
                        },),
                        RoundButton(title: '6', onPress: (){
                          userInput += '6';
                          setState(() {});
                        },),
                        RoundButton(title: '-', onPress: (){
                          userInput += '-';
                          setState(() {});
                        }, color: Color(0xffffa00a)),
                      ],
                    ),
                    Row(
                      children: [
                        RoundButton(title: '1', onPress: (){
                          userInput += '1';
                          setState(() {});
                        },),
                        RoundButton(title: '2', onPress: (){
                          userInput += '2';
                          setState(() {});
                        },),
                        RoundButton(title: '3', onPress: (){
                          userInput += '3';
                          setState(() {});
                        },),
                        RoundButton(title: '+', onPress: (){
                          userInput += '+';
                          setState(() {});
                        }, color: Color(0xffffa00a)),
                      ],
                    ),
                    Row(
                      children: [
                        RoundButton(title: '0', onPress: (){
                          userInput += '0';
                          setState(() {});
                        },),
                        RoundButton(title: '.', onPress: (){
                          userInput += '.';
                          setState(() {});
                        },),
                        RoundButton(title: 'DEL', onPress: (){
                          userInput = userInput.substring(0, userInput.length - 1);
                          setState(() {});
                        },),
                        RoundButton(title: '=', onPress: (){
                          equalPress();
                          setState(() {});
                        }, color: Color(0xffffa00a)),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void equalPress(){

    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL , contextModel);
    answerOutput = eval.toString();

  }
}
