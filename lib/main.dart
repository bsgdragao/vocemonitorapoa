import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vocemonitorapoa/initial_pages/login_com_email_page.dart';
import 'package:vocemonitorapoa/initial_pages/login_com_facebook_page.dart';
import 'package:vocemonitorapoa/initial_pages/login_com_google.dart';
import 'package:vocemonitorapoa/initial_pages/perfil_anonimo_page.dart';
import 'package:vocemonitorapoa/tasks/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Você Monitora POA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffffffff),
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

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
                            Icon(FontAwesomeIcons.google,color: Color(0xffCE107C),),
                            SizedBox(width:10.0),
                            AutoSizeText(
                              '  Participar com Google',
                              style: TextStyle(color: Colors.black), minFontSize: 12.0),
                          ],),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => new LoginGoogle(),),
                          );
                        },
                      ),
                    )
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
                            Icon(FontAwesomeIcons.facebookF,color: Color(0xff4754de),),
                            SizedBox(width:10.0),
                            AutoSizeText(
                              '  Participar com Facebook',
                              style: TextStyle(color: Colors.black), minFontSize: 12.0,
                            ),
                          ],),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  LoginComFacebook(),
                            ),
                          );
                        },
                      ),
                    )
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
                            Icon(FontAwesomeIcons.solidEnvelope,color: Color(0xff4caf50),),
                            SizedBox(width:10.0),
                            AutoSizeText(
                              '  Participar'
                                  ' com Email',
                              style: TextStyle(color: Colors.black), minFontSize: 12.0,
                           ),
                          ],),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  new EmailLogin(auth: new Auth()),
                            ),
                          );
                        },
                      ),
                    )
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
                            Icon(FontAwesomeIcons.user,color: Color(0xffCE107C),),
                            SizedBox(width:10.0),
                            AutoSizeText(
                                '  Usar sem Logar',
                                style: TextStyle(color: Colors.black), minFontSize: 12.0),
                          ],),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => new PerfilAnonimoPage(),),
                          );
                        },
                      ),
                    )
                ),
              ],
            ),
          ],
        ),),
    );
  }
}

