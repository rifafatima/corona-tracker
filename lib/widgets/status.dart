import 'package:flutter/material.dart';

class Status extends StatelessWidget {

  final Color backgroundColor;
  final Color textColor;
  final String title;
  final String count;

  Status(this.backgroundColor, this.textColor, this.title, this.count);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;  

    return Container(
      margin: EdgeInsets.all(10),
      height: 80,
      width: width / 2,
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 16, 
                color: textColor,
                ),
          ),
          Text(
            count,
            style: TextStyle(
                fontSize: 16, 
                fontWeight: 
                FontWeight.bold, 
                color: textColor,
                ),
          )
        ],
      ),
    );
  }
}