import 'package:flutter/material.dart';

class CalcBtn extends StatelessWidget {
  CalcBtn({super.key, required this.title , required this.onCLickedButton ,required this.buttonColor});
  String title;
  Function onCLickedButton;
  Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 1, bottom: 1, left: 1),
        child: GestureDetector(
          onTap:()=> onCLickedButton(title),
          child: Container(
            decoration: BoxDecoration(
                color:buttonColor, borderRadius: BorderRadius.circular(15)),
            child: Center(
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 35),
                )),
          ),
        ),
      ),
    );
  }
}
