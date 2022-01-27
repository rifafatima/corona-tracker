import 'package:corona_app/widgets/status.dart';
import 'package:flutter/material.dart';

class WorldWideWidget extends StatelessWidget {

  final Map worldData;

  WorldWideWidget(this.worldData);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2, //width will be twice of widget height
        ),

        children: [
          Status(Colors.blue[100], Colors.blue[900], 'CONFIRMED', worldData['cases'].toString()),
          Status(Colors.purple[100], Colors.purple[900], 'ACTIVE', worldData['active'].toString()),
          Status(Colors.orange[100], Colors.orange[900], 'RECOVERED', worldData['recovered'].toString()),
          Status(Colors.red[100], Colors.red[900], 'DEATHS', worldData['deaths'].toString()),
         
        ],  

      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),    
    );
  }
}