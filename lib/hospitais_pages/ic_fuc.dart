// Instituto de cardiologia fundação universitária
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocemonitorapoa/data_managers/form_save.dart';

class InstitutoCardiologia extends StatefulWidget {

  @override
  _InstitutoCardiologiaState createState() => _InstitutoCardiologiaState();
}
class _InstitutoCardiologiaState extends State<InstitutoCardiologia> {

  @override
  initState() {
    _getTimeData();
    super.initState();
  }

  final DatabaseReference _dataTime = FirebaseDatabase.instance.reference();
    // Strings de referencia do hospital
    int idHospital = 1;
    String idHospitalTime = "11";

    //String com o nome do Hospital
    String nomeHospital = "Instituto de Cardiologia";

    // Variavel de controle e transferencia dos dados
    var dataTime;

  // Pega o tempo de espera
   _getTimeData() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _dataTime.child(idHospitalTime).once().then((DataSnapshot snapshot){
        dataTime = snapshot.value;
        String temp = dataTime.toString();
        //print('\n1º o temp: é $temp');
        temp =temp.replaceAll('{', '');
        //print('\n2º o temp: é $temp');
        temp = temp.replaceAll('}', '');
        //print('\n3º o temp: é $temp');
        prefs.setString('TempoEsperaShar', temp);
       //print('\nNo getTime o datetime é $dataTime e o temp: é $temp');
        print('Variavel temp no getTime é: $temp');
        //TempoDeEspera.Espera = temp;
        setState(() {

        });

      });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      print(TempoDeEspera.Espera);

    });
    sleep(const Duration(seconds:2));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(nomeHospital),
        ),
        body: new Container(
          child: new Center(
            child: ListView(
              children: <Widget>[
                new InkWell(
                  child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/hospitais/cardiologia.png'),
                      ]
                  ),
                ),
                new InkWell(
                  child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 14.0),
                        AutoSizeText("Tempo atual de", style: TextStyle(color: Colors.blue[700], fontWeight: FontWeight.bold),minFontSize: 30.0, ),
                        AutoSizeText(TempoDeEspera.Espera, style: TextStyle(color: Colors.yellow[700], fontWeight: FontWeight.bold),minFontSize: 36.0, ),
                        //SizedBox(height: 10.0),
                      ]
                  ),
                ),
                new InkWell(
                  child: new Column(
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      SizedBox(
                          height: 50.0,
                          width: 50.0,
                          child: new IconButton(
                            padding: new EdgeInsets.all(0.0),
                            color: Colors.blue[600],
                            icon: new Icon(FontAwesomeIcons.handPointUp, size: 50.0),
                            onPressed: (){
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) => FormSaveData(idHospital: idHospital),),);
                            },
                          )
                      ),
                      SizedBox(height: 20.0),
                      new FlatButton(onPressed: (){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FormSaveData(idHospital: idHospital),),);
                      },
                        child: AutoSizeText('Está esperando a mais tempo? '
                                           '\nFoi atendido em um tempo menor?'
                                            '\nInforme o tempo correto!',
                              textAlign: TextAlign.center, style: TextStyle(
                              color: Colors.blue[600],fontWeight: FontWeight.bold),
                          minFontSize: 20.0,),),
                      SizedBox(height: 0.5),
                      new Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(10.0),
                        child: new Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AutoSizeText("Comentários:", textAlign: TextAlign.left, style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.bold, ),minFontSize: 24.0, ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class TempoDeEspera {
  static String Espera;


}

