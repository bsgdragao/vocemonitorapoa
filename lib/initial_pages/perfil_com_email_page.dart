import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocemonitorapoa/select_hospitais/hospitais_list.dart';
import 'package:vocemonitorapoa/sintomas_pages/triagem_grid_page.dart';
import '../main.dart';



// Bloco da página de Perfil
class PerfilComEmail extends StatefulWidget {
  @override
  _PerfilComEmailState createState() => _PerfilComEmailState();
}

class _PerfilComEmailState extends State<PerfilComEmail> {
  String _email;

  Future<void> _setEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
     setState(() {
       _email = prefs.get('userEmail');
       print(_email);
       (context as Element).reassemble();
     });
  }
  @override
  initState() {
    // TODO: implement initState
    print('Passou no Init');
    _setEmail();
    super.initState();
  }

  // Função para logout
  Future<void> _signOut() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('userEmail', null);
      preferences.clear();
 }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar:  AppBar(
          title:  Text("Usuário Anônimo", style: TextStyle(
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
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => new MyApp(),
                  ),
                );
                _signOut();
              },
            ),
          ],
        ),
        body:Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height:30.0),
            CircleAvatar(
              backgroundImage:AssetImage('assets/contato1.png'),
              radius: 50.0,
            ),
            SizedBox(height:10.0),
            Text(
              "Login só com e-mail:",
              style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[700],fontSize: 20.0),
            ),
            SizedBox(height:10.0),
            Text(
              '$_email' ,
              style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent,fontSize: 26.0),
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
                        new MaterialPageRoute(
                          builder: (context) => new TriagemPage(),
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
                        MaterialPageRoute(builder: (context) =>  new HospitaisList(),
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

