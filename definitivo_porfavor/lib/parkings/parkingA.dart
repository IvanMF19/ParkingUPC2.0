import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


const URLA= 'https://www.google.es/maps/place/Rambla+de+Sant+Nebridi,+9,+08222+Terrassa,+Barcelona/@41.5629307,2.0206284,19z/data=!4m5!3m4!1s0x12a492e7680a8ea1:0x2ab968eb51ea4d14!8m2!3d41.5628876!4d2.0211286';


class ParkingA extends StatefulWidget {
  @override
  _ParkingAState createState() => _ParkingAState();
}

class _ParkingAState extends State<ParkingA> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
        appBar: AppBar(title: Text('PARKING PETIT')), body: _parkingAWidget());
  }

  Widget _parkingAWidget() {
    return StreamBuilder(
        stream: Firestore.instance.collection('tareas').snapshots(),
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
                          width: 168,
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
                                  
                                   Navigator.of(context).pushNamed('/webview');
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
