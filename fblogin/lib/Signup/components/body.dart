import 'package:fblogin/facebooklogin/loginWithFacebook.dart';
import 'package:fblogin/login_facebook.dart';
import 'package:flutter/material.dart';
import 'package:fblogin/Signup/login.dart';
import 'package:fblogin/Signup/components/background.dart';
import 'package:fblogin/Signup/components/or_divider.dart';
import 'package:fblogin/Signup/components/social_icon.dart';
import 'package:fblogin/componentes/already_have_an_account_acheck.dart';
import 'package:fblogin/componentes/rounded_button.dart';
import 'package:fblogin/componentes/rounded_input_field.dart';
import 'package:fblogin/componentes/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';


class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
             RoundedButton(
              text: "INICIAR SESION",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context){
                      return LoginScreen();
                    },
                  ),
                ); 
               },             
            ),
          OrDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                   iconSrc: "assets/icons/facebook.svg",
                  press: () {
                     Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context){
                      return LoginWithFacebook();
                    },
                  ),
                ); 
                  },
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {
                     Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context){
                      return MyappFacebook();
                    },
                  ),
                ); 
                  },
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {
                     Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context){
                      return LoginWithFacebook();
                    },
                  ),
                ); 
                  },
                ),
              ]
          )
          ]
        )
      )
      );
  }
}