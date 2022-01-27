import 'package:flutter/material.dart';

class MostAffectedWidget extends StatelessWidget {

  final List countryData;

  MostAffectedWidget(this.countryData);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              children: [
                Image.network(countryData[index]['countryInfo']['flag'], height: 25,),

                SizedBox(
                  width: 10,
                ),

                Text(countryData[index]['country'], 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  ),
                ),

                 SizedBox(
                  width: 10,
                ),

                Text("Deaths: " +countryData[index]['deaths'].toString(), 
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold),
                  ),
              ],
            ),
          );
        },
        itemCount: 5,
        ),
    );
  }
}