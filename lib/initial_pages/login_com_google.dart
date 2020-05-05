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


class LoginGoogle extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Você Monitora POA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffffffff),
      ),
      home: GoogleSignApp(),
    );
  }
}

class GoogleSignApp extends StatefulWidget {
  @override
  _GoogleSignAppState createState() => _GoogleSignAppState();
}

class _GoogleSignAppState extends State<GoogleSignApp> {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  UserDetails userLogged;

  Future<FirebaseUser> _signIn(BuildContext context) async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();

      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      FirebaseUser userDetails = (await _firebaseAuth.signInWithCredential(credential)).user;
      ProviderDetails providerInfo = new ProviderDetails(userDetails.providerId);

      List<ProviderDetails> providerData = new List<ProviderDetails>();
      providerData.add(providerInfo);

      UserDetails details = new UserDetails(
        userDetails.providerId,
        userDetails.displayName,
        userDetails.photoUrl,
        userDetails.email,
        providerData,
      );

      prefs.setString('userEmail', userDetails.email);
      prefs.setString('userId', userDetails.providerId);
      prefs.setString('userName',  userDetails.displayName);
      prefs.setString('photoUrl',  userDetails.photoUrl);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => new PerfilPage(),
        ),
      );
      return userDetails;
  }

  @override
  void initState() {
    // TODO: implement initState
    verifyLogin();
    super.initState();
  }

  verifyLogin() async {
    print('Entrou no verify');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString('userEmail') != null){
      print('Entrou no if do verify');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => new PerfilPage(),),
      );
    }else{
      print('Entrou no else do verify');
      _signIn(context).then((FirebaseUser user) => print(user)).catchError((e) => print(e));
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

              ],
            ),
          ],
        ),),
    );
  }
}

class UserDetails {
  final String providerDetails;
  final String userName;
  final String photoUrl;
  final String userEmail;
  final List<ProviderDetails> providerData;

  UserDetails(this.providerDetails,this.userName, this.photoUrl,this.userEmail, this.providerData);
}


class ProviderDetails {
  ProviderDetails(this.providerDetails);
  final String providerDetails;
}