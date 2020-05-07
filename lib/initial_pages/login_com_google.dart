import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocemonitorapoa/initial_pages/login_com_email_page.dart';
import 'package:vocemonitorapoa/initial_pages/login_com_facebook_page.dart';
import 'package:vocemonitorapoa/tasks/auth.dart';
import 'perfil_page.dart';


class LoginGoogle extends StatefulWidget {
  @override
  _LoginGoogleState createState() => _LoginGoogleState();
}

class _LoginGoogleState extends State<LoginGoogle> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    saveProfile(user);
    return user;

  }

  saveProfile(FirebaseUser userL) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('userEmail', userL.email);
    prefs.setString('userId', userL.providerId);
    prefs.setString('userName',  userL.displayName);
    prefs.setString('photoUrl',  userL.photoUrl);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new PerfilPage(),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _handleSignIn()
        .then((FirebaseUser user) => print(user))
        .catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/medico.png'),
                AutoSizeText('Você Monitora POA',
                    style: TextStyle(fontSize: 38, color: Color.fromRGBO(65, 105, 225, 2))),
                AutoSizeText('Fazendo login...',
                    style: TextStyle(color: Colors.grey),minFontSize: 14,),
                SizedBox(height:10.0),

              ],
            ),
          ],
        ),),
    );
  }
}
