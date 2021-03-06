import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:vocemonitorapoa/data_managers/hospitals_list.dart';
import 'package:vocemonitorapoa/main.dart';
import 'package:vocemonitorapoa/sintomas_pages/triagem_grid_page.dart';

class LoginComFacebook extends StatefulWidget {
  @override
  _LoginComFacebookState createState() => _LoginComFacebookState();

}

class _LoginComFacebookState extends State<LoginComFacebook> {
  // Booleano para o Status do Perfil
  bool isLoggedIn = false;
  // Variável para salvar os User
  var profileData;
  // Inicializador do metódo do Facebook Login
  var facebookLogin = FacebookLogin();
  // Função para alterar o Status
  void onLoginStatusChanged(bool isLoggedIn, {profileData}) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
      this.profileData = profileData;
    });
  }
  // Construtor do Widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          //Se logado exibe o nome se não Facebook
          title: AutoSizeText(isLoggedIn ? "${profileData['name']}" : "Facebook Login" ),
          actions: <Widget>[
            //Botão de logout
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () => _logout() ,
            ),
          ],
        ),
        body: Container(
        // Aternância entre botão e tela de perfil
          child: Center(
            child: isLoggedIn
                ? _displayUserData(profileData)
                : _displayLoginButton(),
          ),
        ),
      ),
      theme: ThemeData(
        fontFamily: 'Raleway',
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.grey[600],
        ),
        // This colors the [InputOutlineBorder] when it is selected
        primaryColor: Colors.blue[500],
        textSelectionHandleColor: Colors.blue[500],
      ),
    );
  }
  // Inicializador do login
  void initiateFacebookLogin() async {

    var facebookLoginResult =
    await facebookLogin.logIn(['email']);

    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        var graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.width(400)&access_token=${facebookLoginResult
                .accessToken.token}');

        var profile = json.decode(graphResponse.body);
        print(profile.toString());

        onLoginStatusChanged(true, profileData: profile);
        break;
    }
  }
  // Tela de perfil do usuário
  _displayUserData(profileData) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 120.0,
          width: 120.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                profileData['picture']['data']['url'],
              ),
            ),
          ),
        ),
        SizedBox(height: 28.0),
        AutoSizeText(
//          "FBID ${profileData['id']}\n"
              "${profileData['name']}\n${profileData['email']}",
    style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[700]), minFontSize: 10.0,
              textAlign: TextAlign.center,
        ),
        Container(
            width: 280.0,
            child: Align(
              alignment: Alignment.center,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Color(0xffffffff),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.caretRight,color: Color(0xff4754de),),
                    SizedBox(width:20.0),
                    AutoSizeText(
                      'EMERGÊNCIA',
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold ),minFontSize: 10.0
                    ),
                  ],),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => new TriagemPage(),
                        ),
                 );
                },
              ),
            )
        ),
        AutoSizeText(
          "Para qual hospital devo ir?" ,
          style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[700]),minFontSize: 10.0
        ),
        SizedBox(height:30.0),

        Container(
            width: 280.0,
            child: Align(
              alignment: Alignment.center,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Color(0xffffffff),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.caretRight,color: Color(0xff4754de),),
                    SizedBox(width:20.0),
                    AutoSizeText(
                      'Avaliar tempo de espera',
                      style: TextStyle(color: Colors.blue[900],), minFontSize: 14.0
                    ),
                  ],),
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => new HospitalsList(),
                        ),
                 );
                },
              ),
            )
        ),
        AutoSizeText(
          "Avalie o tempo de espera \n     de uma emergência." ,
          style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[700]), minFontSize: 10.0
        ),
      ],
    );
  }
  // Botão de login
  _displayLoginButton() {
    return RaisedButton(
      child: AutoSizeText("Logar no Facebook"),
      onPressed: () => initiateFacebookLogin(),
      color: Colors.blue,
      textColor: Colors.white,
    );
  }
  // Logout
  _logout() async {
    await facebookLogin.logOut();
    onLoginStatusChanged(false);
    await FirebaseAuth.instance.signOut();
    setState(() {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          MyApp()), (Route<dynamic> route) => false);
    });
  }
}