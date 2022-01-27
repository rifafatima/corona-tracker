import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegionalScreen extends StatefulWidget {

  @override
  _RegionalScreenState createState() => _RegionalScreenState();
}

class _RegionalScreenState extends State<RegionalScreen> {

  List countryData;     
  fetchCountryData() async {
    http.Response response= await http.get(Uri.parse('https://corona.lmao.ninja/v2/countries?sort=cases'));
    setState(() {
          countryData= json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Regional Stats'),
      ),
      body: countryData== null? Center(child: CircularProgressIndicator())
      : ListView.builder(
      itemBuilder: (context, index){
        return Container(
          height: 130,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[100],
                blurRadius: 10,
                offset: Offset(0,10)
                )
            ],
             ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(
                      countryData[index]['country'], 
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    Image.network(countryData[index]['countryInfo']['flag'], 
                    height: 50, 
                    width: 60,
                    ),

                  ],
                ),
                ),

                Expanded(
                child: Container(
                  padding: EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'CONFIRMED:' + countryData[index]['cases'].toString(),
                                 style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[900],
                                    ),
                              ),
                              Text(
                                'ACTIVE:' + countryData[index]['active'].toString(),
                                 style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple[900],
                                    ),
                              ),
                              Text(
                                'RECOVERED:' + countryData[index]['recovered'].toString(),
                                 style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange[900],
                                    ),
                              ),
                              Text(
                                'DEATHS:' + countryData[index]['deaths'].toString(),
                                 style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).brightness==Brightness.dark?Colors.grey[100]:Colors.grey[900]
                                    ),
                              ),
                            ],
                ),
                ),
                ),
            ],
          ) ,
          );
      },
      itemCount: countryData==null? 0: countryData.length,
      ),
    );
  }
}