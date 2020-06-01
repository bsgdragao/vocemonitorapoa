import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocemonitorapoa/data_managers/hospitals_list.dart';
import 'package:vocemonitorapoa/pacientes/paciente_select_opt.dart';
import 'package:vocemonitorapoa/sintomas_pages/triagem_grid_page.dart';
import '../main.dart';

// Bloco da página de Perfil
class PacientePage extends StatefulWidget {
  @override
  _PacientePageState createState() => _PacientePageState();
}
class _PacientePageState extends State<PacientePage> {
  final GoogleSignIn _gSignIn =  GoogleSignIn();
  String _email;
  String _nome;
  String _urlPhoto;

  Future<void> _setData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if(prefs.get('userEmail') != null){
        _email = prefs.get('userEmail');
      }else{
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => new MyApp(),
          ),
        );
      }
      if(prefs.getString('userName') != null){
        _nome = prefs.getString('userName');
      }else{
        _nome = 'Anônimo';
      }
      if(prefs.getString('photoUrl') != null){
        _urlPhoto = prefs.getString('photoUrl');
      }else{
        _urlPhoto = 'https://image.flaticon.com/icons/svg/17/17004.svg';
      }

      (context as Element).reassemble();
    });
  }
  @override
  initState() {
    // TODO: implement initState
    _setData();
    super.initState();
  }
  // Função para logout
  Future<void> _signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    await preferences.setString('userEmail', null);
    await FirebaseAuth.instance.signOut();
    await _gSignIn.signOut();
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        MyApp()), (Route<dynamic> route) => false);
  }
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
                _signOut();              },
            ),
          ],
        ),
        body:Center(child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height:12.0),
                CircleAvatar(
                  child: FadeInImage(image: NetworkImage(_urlPhoto), placeholder: AssetImage('assets/contato1.png')),
                  radius: 50.0,
                ),
                SizedBox(height:10.0),
                AutoSizeText(
                    "Paciente: " + _nome,
                    style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[700]), minFontSize: 10.0
                ),
                SizedBox(height:12.0),
                AutoSizeText(
                    '$_email' ,
                    style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent), minFontSize: 10.0
                ),
                SizedBox(height: 12.0),
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
                            SizedBox(width:12.0),
                            AutoSizeText(
                                'Insira novos dados',
                                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold ), minFontSize: 10.0
                            ),
                          ],),
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => new SelectInsertPage(),
                            ),
                          );
                        },
                      ),
                    )
                ),
                SizedBox(height: 20.0,),
              ],
            ),
          ],
        )),
    );
  }
}
