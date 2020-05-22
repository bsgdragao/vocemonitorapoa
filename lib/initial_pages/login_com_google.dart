import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocemonitorapoa/initial_pages/perfil_anonimo_page.dart';
import 'package:vocemonitorapoa/main.dart';
import 'perfil_page.dart';

class LoginGoogle extends StatefulWidget {
  @override
  _LoginGoogleState createState() => _LoginGoogleState();
}

class _LoginGoogleState extends State<LoginGoogle> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();


  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    _handleSignIn();
  }

    void _handleSignIn()async
    {
      final GoogleSignInAccount googleSignInAccount =
      await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
      final FirebaseUser _user = await _auth.currentUser();
      _saveProfile();
    }

  _saveProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    FirebaseUser _user = await FirebaseAuth.instance.currentUser();
    if (_user != null) {
      prefs.setString('userEmail', _user.displayName);
      prefs.setString('userName', _user.email);
      prefs.setString('photoUrl', _user.photoUrl);

      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => new PerfilPage(),
        ),
      );
    }else{
     await _handleSignIn();
     await _saveProfile();
    }
  }

  confirmLogged() async{
//    final SharedPreferences prefs = await SharedPreferences.getInstance();
//    if(prefs.getString('userEmail') != null)
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('userEmail') != null){
      Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => new PerfilPage(), ),);
    }else {
      _saveProfile();
    }
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
                SizedBox(height:10.0),
                Padding(
                  padding: EdgeInsets.all(60.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Color(0xffffffff),
                    child: Center(
                      child: AutoSizeText(
                          '  Entrar',
                          textAlign: TextAlign.center, style: TextStyle(color: Colors.blue[900]), minFontSize: 12.0),
                    ),
                    onPressed: (){
                      confirmLogged();
                    },
                  ),
                ),
                AutoSizeText('Problemas com login?'
                    '\n Entre Anônimo.',
                  textAlign: TextAlign.center, style: TextStyle(color: Color.fromRGBO(65, 105, 225, 2)), minFontSize: 12,),

              ],
            ),
          ],
        ),),
    );
  }
}
