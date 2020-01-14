import 'package:definitivo_porfavor/services/auth.dart';
import 'package:definitivo_porfavor/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final Authservice _auth = Authservice();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text fields state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.blue[100],
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Colors.blue[400],
              elevation: 0.0,
              title: Text('Inici de sessió'),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Crea un compte'),
                  onPressed: () {
                    widget.toggleView();
                  },
                )
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/upc.png',
                          fit: BoxFit.none,
                          scale: 3.28,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Correu electrònic',
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blue[400], width: 2.0)),
                        ),
                        validator: (val) =>
                            val.isEmpty ? 'Introdueix un correu' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        }),
                    SizedBox(height: 20.0),
                    TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Contrasenya',
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blue[400], width: 2.0)),
                        ),
                        obscureText: true,
                        validator: (val) => val.length < 6
                            ? 'Introdueix una contrassenya de 6 o més caràcters'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        }),
                    SizedBox(height: 20.0),
                    RaisedButton(
                      color: Colors.blue[500],
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() => loading = true);
                          dynamic result = await _auth
                              .signinWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              error =
                                  'No es pot iniciar amb aquest credencials';
                              loading = false;
                            });
                          }
                        }
                      },
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
