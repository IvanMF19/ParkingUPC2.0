import 'package:definitivo_porfavor/screens/authenticate/authenticate.dart';
import 'package:definitivo_porfavor/models/user.dart';
import 'package:definitivo_porfavor/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);
    
    // return el Home o el Authenticator widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}