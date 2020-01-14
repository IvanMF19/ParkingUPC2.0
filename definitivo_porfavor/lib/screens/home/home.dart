import 'package:definitivo_porfavor/services/auth.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {

final Authservice _auth = Authservice();
  
  @override
 Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: new AppBar(
        title: new Text("Menú principal"),
        backgroundColor: Colors.blue[300],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Tanca sessió'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
       drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new ListTile(
                title: new Text("Parking A"),
                trailing: new Icon(Icons.local_parking),
                onTap: () {
                  Navigator.of(context).pushNamed('/9');
                }),
                new ListTile(
                title: new Text("Parking B"),
                trailing: new Icon(Icons.local_parking),
                onTap: () {
                  Navigator.of(context).pushNamed('/10');
                }),
                new ListTile(
                title: new Text("Parking C"),
                trailing: new Icon(Icons.local_parking),
                onTap: () {
                  Navigator.of(context).pushNamed('/11');
                }),
                new ListTile(
                title: new Text("Parking D"),
                trailing: new Icon(Icons.local_parking),
                onTap: () {
                  Navigator.of(context).pushNamed('/12');
                }),
                
          ],
        
      ),
    ),
       body: new Column(
          children: <Widget>[
            Container(
              width: 450,
              height: 370,
              decoration: BoxDecoration(
                          color: Colors.blue[50],
                          shape: BoxShape.rectangle,
                        ),
                        child: Image.asset(
                          'assets/PARKINGS.png',
                          fit: BoxFit.none,
                          scale: 1.2,
                        ),
            ),
            Center(
              child: Row(
                children: <Widget>[
                  Container(width: 30),
                  Container(
                    width: 150,
                    height: 80,
                  child: RaisedButton(
                      child: Text("Parking A", style: TextStyle(fontSize: 20),),
                      
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pushNamed('/5');
                      }),
                  ),
                      Container(
                        width: 50,
                      ),
                      Container(
                    width: 150,
                    height: 80,
                  child: RaisedButton(
                      child: Text("Parking B", style: TextStyle(fontSize: 20),),
                      
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pushNamed('/6');
                      }),
                  ),
                ],
              ),
              
            ),
            Row(
              children: <Widget>[
                Container(
                  height: 20,
                )
              ],
            ),
            Center(
              child: Row(
                children: <Widget>[
                  Container(width: 30),
                  Container(
                    width: 150,
                    height: 80,
                  child: RaisedButton(
                      child: Text("Parking C", style: TextStyle(fontSize: 20),),
                      
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pushNamed('/7');
                      }),
                  ),
                      Container(
                        width: 50,
                      ),
                      Container(
                    width: 150,
                    height: 80,
                  child: RaisedButton(
                      child: Text("Parking D", style: TextStyle(fontSize: 20),),
                      
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pushNamed('/8');
                      }),
                  ),
                ],
              ),
              
            ),
               
          
          ],
        ),
        );
  }
}