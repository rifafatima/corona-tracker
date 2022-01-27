import 'dart:convert';
import 'package:corona_app/models/information.dart';
import 'package:corona_app/screens/regional_screen.dart';
import 'package:corona_app/widgets/information_widget.dart';
import 'package:corona_app/widgets/most_affected_widget.dart';
import 'package:corona_app/widgets/world_wide_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //we call our api from here and pass data in world wide status widgets

  Map worldData;
  fetchWorldWideData() async {
    http.Response response= await http.get(Uri.parse('https://corona.lmao.ninja/v2/all'));
    setState(() {
          worldData= json.decode(response.body);
    });
  }

  List countryData;      //map of lists of data as response
  fetchCountryData() async {
    http.Response response= await http.get(Uri.parse('https://corona.lmao.ninja/v2/countries?sort=cases'));
    setState(() {
          countryData= json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldWideData();
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('COVID-19 TRACKER'),
      centerTitle: false,
      ),

      body: SingleChildScrollView(child: 
  
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

        Container(
          height: 100,
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          color: Colors.greenAccent[100],
          child: Text(InformationFile.quote, 
          style: TextStyle(
                    color: Colors.green[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                    ),
              ),
          ),

          SizedBox(
            height: 10,
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('WORLDWIDE', 
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>  RegionalScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(8),
                    child: Text('REGIONAL', style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          worldData== null? CircularProgressIndicator()
          : WorldWideWidget(worldData),

           SizedBox(
            height: 10,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text('MOST AFFECTED COUNTRIES', 
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
          ),

          SizedBox(
            height: 10,
          ),

          countryData==null? Container(): MostAffectedWidget(countryData),

          SizedBox(
            height: 20,
          ),

          InformationWidget(),

          SizedBox(
            height: 20,
          ),

          Center(
            child: Text('WEAR MASK, STAY SAFE!',   
             style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,  
            ),
             //textAlign: TextAlign.center,
            ),
          ),

          SizedBox(
            height: 20,
          ),

        ],),
        ),
    );
  }
}