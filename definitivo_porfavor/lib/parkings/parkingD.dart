import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ParkingD extends StatefulWidget {
  @override
  _ParkingDState createState() => _ParkingDState();
}

class _ParkingDState extends State<ParkingD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
        appBar: AppBar(title: Text('PARKING FOOT')), body: _parkingAWidget());
  }

  Widget _parkingAWidget() {
    return StreamBuilder(
        stream: Firestore.instance.collection('parkingD').snapshots(),
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
                          width: 160,
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
                          width: 210,
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
                    Container(
                      height: 35,
                    ),
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
                                  Navigator.of(context).pushNamed('/webview3');
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
