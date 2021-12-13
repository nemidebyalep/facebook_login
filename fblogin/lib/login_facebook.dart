import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class MyappFacebook extends StatefulWidget {

  @override
  _MyappFacebookState createState() => _MyappFacebookState();
}

class _MyappFacebookState extends State<MyappFacebook> {
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(title: Text('title'), actions: [
      FlatButton(child: Text('login', style: TextStyle(color: Colors.amber),),onPressed:() async{
        final FacebookLoginResult result =
        await facebookSignIn.logIn(['email']);

      switch(result.status){
        case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        print('''
          Logged in!

          Token: ${accessToken.token}
          User id: ${accessToken.userId}
          Expires: ${accessToken.expires}
          Permissions: ${accessToken.permissions}
          Declined permissions: ${accessToken.declinedPermissions}          
        ''');
        break;
        case FacebookLoginStatus.cancelledByUser:
        print('Login cancelled by the user.');
        break;
        case FacebookLoginStatus.error:
        print('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
            break;
      }
      },
      )  
    ],
    ),
    );
  }
}