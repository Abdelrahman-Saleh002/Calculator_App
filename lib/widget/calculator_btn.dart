import 'package:flutter/material.dart';
import 'package:calculator/widget/onclick.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  String result = '';
  String lhs ='';
  String operator = '';
  String rhs='';


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView(scrollDirection: Axis.horizontal, children: [
              Container(
                child: Row(
                  children: [
                    Text(
                      result,
                      style: TextStyle(fontSize: 30 , color: Colors.black , fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ])),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalcBtn(title: 'C', onCLickedButton: deleteAll ,buttonColor: Colors.red,),
              CalcBtn(title: '( )', onCLickedButton: deleteAll , buttonColor: Colors.orange,),
              CalcBtn(title: '%',onCLickedButton: operatorNumbers,buttonColor: Colors.orange,),
              CalcBtn(title: 'DEL', onCLickedButton: deleteNumbers ,buttonColor: Colors.red,),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalcBtn(title: '7', onCLickedButton: onClickbutton , buttonColor: Colors.blue,),
              CalcBtn(title: '8', onCLickedButton: onClickbutton , buttonColor: Colors.blue,),
              CalcBtn(title: '9', onCLickedButton: onClickbutton , buttonColor: Colors.blue,),
              CalcBtn(title: '/', onCLickedButton: operatorNumbers ,buttonColor: Colors.green,),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalcBtn(title: '4', onCLickedButton: onClickbutton ,buttonColor: Colors.blue,),
              CalcBtn(title: '5', onCLickedButton: onClickbutton , buttonColor: Colors.blue,),
              CalcBtn(title: '6', onCLickedButton: onClickbutton , buttonColor: Colors.blue,),
              CalcBtn(title: '*', onCLickedButton: operatorNumbers ,buttonColor: Colors.green,),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalcBtn(title: '1', onCLickedButton: onClickbutton ,buttonColor: Colors.blue,),
              CalcBtn(title: '2', onCLickedButton: onClickbutton , buttonColor: Colors.blue,),
              CalcBtn(title: '3', onCLickedButton: onClickbutton, buttonColor: Colors.blue,),
              CalcBtn(title: '-', onCLickedButton: operatorNumbers , buttonColor: Colors.green,),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalcBtn(title: '.', onCLickedButton: onClickbutton , buttonColor: Colors.blue,),
              CalcBtn(title: '0', onCLickedButton: onClickbutton , buttonColor: Colors.blue,),
              CalcBtn(title: '=', onCLickedButton: equalOperator, buttonColor: Colors.green,),
              CalcBtn(title: '+', onCLickedButton: operatorNumbers , buttonColor: Colors.green,),
            ],
          ),
        ),
      ],
    );
  }

  void onClickbutton(String text) {
    result += text;
    setState(() {});
  }

  void operatorNumbers(String operatorClicked){
    if(operator.isEmpty){
      lhs =result;
    }else{
      rhs = result;
      lhs = calculate(lhs , operator ,rhs);
    }
    operator =operatorClicked;
    result = '';

    setState(() {

    });
  }

  String calculate(String lhs, String operator, String rhs) {
    double number1 =double.parse(lhs);
    double number2 =double.parse(rhs);
    double finalResult=0.0;

    if(operator == '+'){
      finalResult = number1 + number2;
    }else if(operator == '-'){
      finalResult = number1 - number2;
    }else if(operator == '/'){
      finalResult = number1 / number2;
    }else if(operator == '*'){
      finalResult = number1 * number2;
    }else if(operator == '%'){
      finalResult = number1 % number2;
    }

    return finalResult.toString();
  }
  void equalOperator(String equal){
    rhs =result;
    result = calculate(lhs, operator, rhs);
    lhs= '';
    operator = '';
    setState(() {

    });
  }
  void deleteNumbers(String number){
    if(result.isNotEmpty){
      result = result.substring(0 , result.length-1);
      setState(() {

      });
    }
  }
  void deleteAll(String finalRes){
    result = '';
    setState(() {

    });
  }

}
