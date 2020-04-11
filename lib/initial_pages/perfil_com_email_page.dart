import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vocemonitorapoa/sintomas_pages/triagem_grid_page.dart';
import '../main.dart';



// Bloco da página de Perfil
class PerfilComEmail extends StatefulWidget {

  final String email;
  const PerfilComEmail({Key key, @required this.email}) : super(key: key);



  @override
  _PerfilComEmailState createState() => _PerfilComEmailState();
}

class _PerfilComEmailState extends State<PerfilComEmail> {


  initState() {
    // TODO: implement initState
    super.initState();
    print(widget.email);
  }

  // Função para logout
  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e); // TODO: show dialog with error
    }
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
              "Logado com o e-mail:",
              style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[700],fontSize: 20.0),
            ),
            SizedBox(height:10.0),
            Text(
              "E-mail : " + widget.email,
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
                          style: TextStyle(color: Colors.black,fontSize: 18.0),
                        ),
                      ],),
                    onPressed: () {
//                      Navigator.push(
//                        context,
//                        new MaterialPageRoute(
//                          builder: (context) => new ShoppingList(),
//                        ),
//                      );
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

