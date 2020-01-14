import 'package:definitivo_porfavor/parkingDrawer/ParkingDrawerA.dart';
import 'package:definitivo_porfavor/parkingDrawer/ParkingDrawerB.dart';
import 'package:definitivo_porfavor/parkingDrawer/ParkingDrawerC.dart';
import 'package:definitivo_porfavor/parkingDrawer/ParkingDrawerD.dart';
import 'package:definitivo_porfavor/parkings/parkingA.dart';
import 'package:definitivo_porfavor/parkings/parkingB.dart';
import 'package:definitivo_porfavor/parkings/parkingC.dart';
import 'package:definitivo_porfavor/parkings/parkingD.dart';
import 'package:definitivo_porfavor/screens/wrapper.dart';
import 'package:definitivo_porfavor/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:provider/provider.dart';
import 'package:definitivo_porfavor/models/user.dart';


void main() => runApp(MyApp());
const URLA= 'https://www.google.es/maps/place/Rambla+de+Sant+Nebridi,+9,+08222+Terrassa,+Barcelona/@41.5629307,2.0206284,19z/data=!4m5!3m4!1s0x12a492e7680a8ea1:0x2ab968eb51ea4d14!8m2!3d41.5628876!4d2.0211286';
const URLC= 'https://www.google.es/maps/place/Carrer+de+la+Igualtat,+31,+08222+Terrassa,+Barcelona/@41.5625195,2.0171263,17z/data=!3m1!4b1!4m5!3m4!1s0x12a492e79057a9f9:0xb45d737150c13f4b!8m2!3d41.5625195!4d2.019315';
const URLB= 'https://www.google.es/maps/place/Parking+2/@41.5600973,2.0265272,19.25z/data=!4m13!1m7!3m6!1s0x12a492e79057a9f9:0xb45d737150c13f4b!2sCarrer+de+la+Igualtat,+31,+08222+Terrassa,+Barcelona!3b1!8m2!3d41.5625195!4d2.019315!3m4!1s0x12a492e1dc2f7645:0xd02749bace25fa68!8m2!3d41.5598599!4d2.0269849';
const URLD= 'https://www.google.es/maps/place/Carrer+del+Violinista+Vellsola,+37,+08222+Terrassa,+Barcelona/@41.568517,2.0234773,19z/data=!3m1!4b1!4m13!1m7!3m6!1s0x12a492e79057a9f9:0xb45d737150c13f4b!2sCarrer+de+la+Igualtat,+31,+08222+Terrassa,+Barcelona!3b1!8m2!3d41.5625195!4d2.019315!3m4!1s0x12a492d9334722ef:0xa94c8c47fac14f!8m2!3d41.5685172!4d2.0240219';


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: Authservice().user,
      child: MaterialApp(
        home: Wrapper(),
        routes: {
             '/5':(context)=> ParkingA(),
             '/6':(context)=> ParkingB(),
             '/7':(context)=> ParkingC(),
             '/8':(context)=> ParkingD(),
             '/9':(context)=> ParkingDrawerA(),
             '/10':(context)=> ParkingDrawerB(),
             '/11':(context)=> ParkingDrawerC(),
             '/12':(context)=> ParkingDrawerD(),

             '/webview':(_) => WebviewScaffold(
                url: URLA,
                withJavascript: true,
                withLocalStorage: true,

              
             ),
             '/webview1':(_) => WebviewScaffold(
                url: URLB,
                withJavascript: true,
                withLocalStorage: true,

              
             ),
             '/webview2':(_) => WebviewScaffold(
                url: URLC,
                withJavascript: true,
                withLocalStorage: true,

              
             ),
             '/webview3':(_) => WebviewScaffold(
                url: URLD,
                withJavascript: true,
                withLocalStorage: true,

              
             ),
           }
      ),
    );
     
  }
}

