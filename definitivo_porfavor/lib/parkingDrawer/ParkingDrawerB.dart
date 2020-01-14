import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ParkingDrawerB extends StatefulWidget {
  @override
  _ParkingDrawerBState createState() => _ParkingDrawerBState();
}

class _ParkingDrawerBState extends State<ParkingDrawerB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
        appBar: AppBar(title: Text('PARKING B')), body: _parkingAWidgetB());
  }

  Widget _parkingAWidgetB() {
    return StreamBuilder(
        stream: Firestore.instance.collection('parkingB').snapshots(),
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
                    Container(
                      height: 250,
                      child: Image.asset('assets/parkingB.png'),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 100,
                          width: 20,
                        ),
                        Text(
                          'Disancia a la Universitat',
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          width: 120,
                        ),
                        Text(
                          data['dist'],
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 20,
                        ),
                        Text(
                          'Preu al minut',
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          width: 155,
                        ),
                        Text(
                          data['preu'],
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          '€/minut',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    Container(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: data['taller'],
                        ),
                        Text(' Taller d automobils'),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: data['guardia'],
                        ),
                        Text('Vigilant a la nit'),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: data['cajero'],
                        ),
                        Text('Caixer automàtic'),
                      ],
                    ),
                  ],
                );
              });
        });
  }
}
