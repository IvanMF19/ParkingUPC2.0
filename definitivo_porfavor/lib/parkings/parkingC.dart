import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

const URL2= 'https://www.google.es/maps/place/Carrer+de+la+Igualtat,+31,+08222+Terrassa,+Barcelona/@41.5625195,2.0171263,17z/data=!3m1!4b1!4m5!3m4!1s0x12a492e79057a9f9:0xb45d737150c13f4b!8m2!3d41.5625195!4d2.019315';

class ParkingC extends StatefulWidget {
  @override
  _ParkingCState createState() => _ParkingCState();
}

class _ParkingCState extends State<ParkingC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
        appBar: AppBar(title: Text('PARKING CITM')), body: _parkingAWidget());
  }

  Widget _parkingAWidget() {
    return StreamBuilder(
        stream: Firestore.instance.collection('parkingC').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<DocumentSnapshot> docs = snapshot.data.documents;
          return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> data = docs[index].data;
                return Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 100,
                          width: 20,
                        ),
                        Text(
                          'Places disponibles',
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          width: 170,
                        ),
                        Text(
                          data['plazas'],
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 20,
                        ),
                        Text(
                          'Places totals',
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          width: 220,
                        ),
                        Text(
                          data['plazas1'],
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 20,
                        ),
                        Text(
                          'Hora d apertura:',
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          width: 180,
                        ),
                   Text(
                          data['Horaop'],
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 20,
                        ),
                        Text(
                          'Hora tancament:',
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          width: 175,
                        ),
                      Text(
                          data['horace'],
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 20,
                        ),
                        Text(
                          'Estat del parking:',
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          width: 190,
                        ),
                      ],
                    ),

                      Row(
                      children: <Widget>[
                        Container(
                          height: 10,
                          width: 20,
                        ),
                        Text(
                          data['estat'],
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Container(height: 35,),
                    Center(
                      child: Row(
                        children: <Widget>[
                          Container(width: 140),
                          Container(
                            width: 150,
                            height: 80,
                            child: RaisedButton(
                                child: Text(
                                  "Maps",
                                  style: TextStyle(fontSize: 20),
                                ),
                                color: Theme.of(context).primaryColor,
                                textColor: Colors.white,
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/webview2');
                                }),
                          ),
                          Container(
                            width: 50,
                          ),
                          
                        ],
                      ),
                    ),
                  ],
                );
              });
        });
  }
}
