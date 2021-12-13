import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';



class LoginWithFacebook extends StatefulWidget {
  @override
  _LoginWithFacebookState createState() => _LoginWithFacebookState();
}

class _LoginWithFacebookState extends State<LoginWithFacebook> {
  bool isSignIn = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  User _user;
  FacebookLogin facebookLogin = FacebookLogin();

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Container(
       height: size.height,
      width: double.infinity,
      
     decoration: BoxDecoration(
      
      image: DecorationImage(
      image:  AssetImage('assets/images/nena.jpg'),         
       ),      
       ),
     
      child: Scaffold(        
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(""),
        ),
        body: isSignIn
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 150,
                      backgroundImage: NetworkImage(_user.photoURL),
                    ),
                    Text(
                      _user.displayName,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    OutlineButton(
                      onPressed: () {
                        gooleSignout();
                      },
                      child: Text(
                        "Cerrar Sesión",
                        style: TextStyle(
                           color: Colors.white,
                      fontWeight: FontWeight.bold,
                     
                          fontSize: 25),
                      ),
                    )
                  ],
                ),
              )
            : Center(
                child: OutlineButton(
                  onPressed: () async {
                    await handleLogin();
                  },
                  child: Text(
                    "Conectarse con facebook",
                    style: TextStyle(
                      color: Colors.cyanAccent,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 33

                      ),
                    
                  ),
                ),
              ),
      ),
    );
  }

  Future<void> handleLogin() async {
    final FacebookLoginResult result = await facebookLogin.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        break;
      case FacebookLoginStatus.loggedIn:
        try {
          await loginWithfacebook(result);
        } catch (e) {
          print(e);
        }
        break;
    }
  }
  Future loginWithfacebook(FacebookLoginResult result) async {
    final FacebookAccessToken accessToken = result.accessToken;
    AuthCredential credential =
        FacebookAuthProvider.credential(accessToken.token);
    var a = await _auth.signInWithCredential(credential);
    setState(() {
      isSignIn = true;
      _user = a.user;
    });
  }
  Future<void> gooleSignout() async {
    await _auth.signOut().then((onValue) {
      setState(() {
        facebookLogin.logOut();
        isSignIn = false;
      });
    });
  }
}
