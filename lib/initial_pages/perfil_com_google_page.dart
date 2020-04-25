import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vocemonitorapoa/data_managers/hospitals_list.dart';
import 'package:vocemonitorapoa/sintomas_pages/triagem_grid_page.dart';
import '../main.dart';

// Bloco da página de Perfil
class PerfilGoogle extends StatelessWidget {
  final UserDetails detailsUser;

  PerfilGoogle({Key key, @required this.detailsUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GoogleSignIn _gSignIn =  GoogleSignIn();

    return  Scaffold(
        appBar:  AppBar(
          title:  Text(detailsUser.userName, style: TextStyle(
              color: Colors.blueAccent
          )),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.signOutAlt,
                size: 20.0,
                color: Colors.blueAccent,
              ),
              onPressed: (){
                _gSignIn.signOut();
                print('Logout');
                Navigator.pop(context);

              },
            ),
          ],
        ),
        body:Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height:30.0),
            CircleAvatar(
              backgroundImage:NetworkImage(detailsUser.photoUrl),
              radius: 50.0,
            ),
            SizedBox(height:10.0),
            Text(
              "Nome : " + detailsUser.userName,
              style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[700],fontSize: 20.0),
            ),
            SizedBox(height:10.0),
            Text(
              "E-mail : " + detailsUser.userEmail,
              style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent,fontSize: 20.0),
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
                        Text(
                          'EMERGÊNCIA',
                          style: TextStyle(color: Colors.red,fontSize: 30.0, fontWeight: FontWeight.bold ),
                        ),
                      ],),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  new TriagemPage(),
                        ),
                      );
                    },
                  ),
                )
            ),
            Text(
              "Para qual hospital devo ir?" ,
              style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[700],fontSize: 20.0),
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
                        Text(
                          'Avaliar tempo de espera',
                          style: TextStyle(color: Colors.blue[900],fontSize: 18.0),
                        ),
                      ],),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  new HospitalsList(),
                        ),
                      );
                    },
                  ),
                )
            ),
            Text(
              "Avalie o tempo de espera \n     de uma emergência." ,
              style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[700],fontSize: 20.0),
            ),
           ],
        ),)
    );
  }
}