import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocemonitorapoa/data_managers/hospitals_list.dart';
import 'package:vocemonitorapoa/sintomas_pages/triagem_grid_page.dart';
import '../main.dart';

// Bloco da página de Perfil
class PerfilAnonimoPage extends StatefulWidget {
  @override
  _PerfilAnonimoPageState createState() => _PerfilAnonimoPageState();
}
class _PerfilAnonimoPageState extends State<PerfilAnonimoPage> {
  String _urlPhoto = 'https://image.flaticon.com/icons/svg/17/17004.svg';
  String _nome = 'Anônimo';
  String _email = "Não logado!";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar:  AppBar(
          title:  AutoSizeText("Perfil de Usuário: ", style: TextStyle(
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
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                    MyApp()), (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
        body:Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height:30.0),
            CircleAvatar(
              child: FadeInImage(image: NetworkImage(_urlPhoto), placeholder: AssetImage('assets/contato1.png')),
              radius: 50.0,
            ),
            SizedBox(height:10.0),
            AutoSizeText(
                "Nome: " + _nome,
                style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[700]), minFontSize: 10.0
            ),
            SizedBox(height:10.0),
            AutoSizeText(
                '' + _email ,
                style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent), minFontSize: 10.0
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
                            'EMERGÊNCIA',
                            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold ), minFontSize: 10.0
                        ),
                      ],),
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => new TriagemPage(),
                        ),
                      );
                    },
                  ),
                )
            ),
            AutoSizeText(
                "Para qual hospital devo ir?" ,
                style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[700]), minFontSize: 10.0
            ),
            SizedBox(height:30.0),
            AutoSizeText(
                "   Você não poderá avaliar "
                    "\n   nem comentar pois não está logado. ",
                style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[700]), minFontSize: 10.0
            ),
          ],
        ),)
    );
  }
}

