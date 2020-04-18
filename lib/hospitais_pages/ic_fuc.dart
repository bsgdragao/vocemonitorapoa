// Instituto de cardiologia fundação universitária
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'file:///C:/Users/bruno/VisualStudioProjects/voce_monitora_poa/lib/data_managers/form_save.dart';


class InstitutoCardiologia extends StatefulWidget {

  @override
  _InstitutoCardiologiaState createState() => _InstitutoCardiologiaState();
}

class _InstitutoCardiologiaState extends State<InstitutoCardiologia> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Instituto de Cardiologia"),
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
                        AutoSizeText("Tempo de espera atual:", style: TextStyle(color: Colors.blue[700], fontWeight: FontWeight.bold),minFontSize: 30.0, ),
                        SizedBox(height: 14.0),
                        AutoSizeText("1 Hora 20 Minutos", style: TextStyle(color: Colors.yellow[800], fontWeight: FontWeight.bold),minFontSize: 30.0, ),
                      ]
                  ),
                ),
                new InkWell(
                  child: new Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      SizedBox(
                          height: 70.0,
                          width: 70.0,
                          child: new IconButton(
                            padding: new EdgeInsets.all(0.0),
                            color: Colors.blue[600],
                            icon: new Icon(FontAwesomeIcons.handPointUp, size: 70.0),
                            onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => FormSaveData(idHospital: 1),),);
                            },
                          )
                      ),
                      SizedBox(height: 20.0),
                      AutoSizeText("Errado? Informe o tempo correto", style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.bold),minFontSize: 20.0, ),
                      SizedBox(height: 30.0),
                      AutoSizeText("Comentários:  \n\n Está horrivel hoje!!!!!", textAlign: TextAlign.left, style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.bold, ),minFontSize: 20.0, ),

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
