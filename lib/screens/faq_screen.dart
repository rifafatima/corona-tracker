import 'package:corona_app/models/information.dart';
import 'package:flutter/material.dart';

class FAQ extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index){
          return ExpansionTile(
              title: Text(
                InformationFile.questionAnswers[index]['question'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(InformationFile.questionAnswers[index]['answer']),
                )
              ],
            );
        },
        itemCount: InformationFile.questionAnswers.length,
        ),
    );
  }
}
