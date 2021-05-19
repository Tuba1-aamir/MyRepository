import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';


void main()=> runApp(MaterialApp(home:HomePage(),));

class HomePage extends StatefulWidget{
  _HomePageState  createState() => _HomePageState();
}
//global variables(objects) for FirebaseAuth and Google Sign=In services
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class _HomePageState extends State<HomePage> {

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.symmetric(horizontal: 30),
        //color:listOfColors[_selectedIndex],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          //GOOGLE SIGN IN
          children: <Widget>[
            MaterialButton(
              elevation: 0,
              minWidth: double.maxFinite,
              height: 50,
              onPressed: () async {
                //all requests asynchornous in nature,thts why using await
                //Here goes the logic for Google SignIn discussed in the next section
                {
                  //calling "signIn" method with "googleSignIn" object created above
                  //the user will sign in ,option to choose account is displayed
                  //the account will store in googleUser
                  final GoogleSignInAccount googleUser = await googleSignIn
                      .signIn();
                  //for verifying authencity
                  final GoogleSignInAuthentication googleAuth = await googleUser
                      .authentication;
                  //we will ask for info about the specifc "signed-in user" on basis of ID and Access Token from google
                  final AuthCredential credential = GoogleAuthProvider
                      .credential(idToken: googleAuth.idToken,
                      accessToken: googleAuth.accessToken);
                  //bind the user to our databse (i.e firebase)
                  //'signInWithCredential' will return credential to our firebase
                  final User user = (await firebaseAuth.signInWithCredential(
                      credential)).user; //
                }
              },
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(FontAwesomeIcons.google),
                  SizedBox(width: 10),
                  Text('Sign-in using Google',
                      style: TextStyle(color: Colors.black87, fontSize: 16)),
                ],
              ),
              textColor: Colors.black87,
            ),
            SizedBox(height: 100),
          ],
        ), //GOOGLE SIGN IN
      ),
    );
  }
}

