// Hospital nossa senhora da conceição
// Hospital de clinicas de porto alegre
// Instituto de cardiologia fundação universitária
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vocemonitorapoa/data_managers/form_save.dart';

class HospitalSantaCasa extends StatefulWidget {

  @override
  _HospitalSantaCasaState createState() => _HospitalSantaCasaState();
}
class _HospitalSantaCasaState extends State<HospitalSantaCasa> {
  // Strings de referencia do hospital
  int idHospital = 13;
  String idComentarios = "13";
  String idHospitalTime = "131";
  //String com o nome do Hospital
  String nomeHospital = "Santa Casa de Misericórdia";

  @override
  initState() {
    super.initState();
  }
  // Instancia do Firebase para a DB do tempo
  final DatabaseReference _dataTime = FirebaseDatabase.instance.reference();

  // Variavel de controle e transferencia dos dados
  var dataTime;
  var dataComent;

  @override
  Widget build(BuildContext context) {
    Widget comentsWidget() {
      return StreamBuilder(
          stream: FirebaseDatabase.instance
              .reference()
              .child(idComentarios)
              .onValue,
          builder: (BuildContext context, AsyncSnapshot<Event> snapshot) {
            if (snapshot.hasData) {
              Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
              map.forEach((dynamic, v) => print(v[dynamic]));
              return new ListView.builder(
                itemCount: map.length,
                itemBuilder: (BuildContext context, int index) {
                  String key = map.keys.elementAt(index);
                  return new Column(
                    children: <Widget>[
                      new ListTile(
                        title: new AutoSizeText("$key", style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.bold),minFontSize: 18.0),
                        subtitle: new AutoSizeText("${map[key].toString().replaceAll("}", "").trim().replaceAll('{', '')}", style: TextStyle(color: Colors.blue[500]),minFontSize: 18.0),
                      ),
                      new Divider(
                        height: 2.0,
                      ),
                    ],
                  );
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          });
    }
    Widget timeWidget() {
      return StreamBuilder(
          stream: FirebaseDatabase.instance
              .reference().child(idHospitalTime)
              .onValue,
          builder: (BuildContext context, AsyncSnapshot<Event> snapshot) {
            if (snapshot.hasData) {
              Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
              //map.forEach((dynamic, v) => print(v[dynamic]));
              return new ListView.builder(
                itemCount: map.length,
                itemBuilder: (BuildContext context, var index) {
                  String key = map.keys.elementAt(index);
                  return new Column(
                    children: <Widget>[
                      new ListTile(
                        //  title: new AutoSizeText("$key", style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.bold),minFontSize: 18.0),
                        title: new AutoSizeText("${map[key].toString().replaceAll("}", "").trim().replaceAll('{', '')}", style: TextStyle(color: Colors.yellow[700], fontWeight: FontWeight.bold),textAlign: TextAlign.center, minFontSize: 30.0),
                        //  subtitle: new AutoSizeText("${map[key].toString().replaceAll("}", "").trim().replaceAll('{', '')}", style: TextStyle(color: Colors.blue[500]),minFontSize: 18.0),
                      ),
                      new Divider(
                        height: 2.0,
                      ),
                    ],
                  );
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          });
    }

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
                        AutoSizeText("Tempo de espera atual:", style: TextStyle(color: Colors.blue[700], fontWeight: FontWeight.bold),minFontSize: 30.0),
                      ]
                  ),
                ),
                new Row(
                  children: <Widget> [
                    Expanded(child: SizedBox(
                      height: 50,
                      child: new Flexible(
                        child: timeWidget(),
                      ),
                    ))
                  ],
                ),
                new InkWell(
                  child: new Column(
                    children: <Widget>[
                      //SizedBox(height: 10.0),
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
                      new Row(
                        children: <Widget> [
                          Expanded(child: SizedBox(
                            height: 200,
                            child: new Flexible(
                              child: comentsWidget(),
                            ),
                          ))
                        ],
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



