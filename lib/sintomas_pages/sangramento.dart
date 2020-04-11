import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vocemonitorapoa/select_hospitais/atende_coluna_adulto.dart';
import 'package:vocemonitorapoa/select_hospitais/atende_coluna_infantil.dart';

class SangramentoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sangramento", style: TextStyle(
            color: Colors.blueAccent
        ))
      ),
      body: Center(child:
      Column(
      mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      SizedBox(height:20.0),
      Text("Selecione o tipo de\natendimento:", style: TextStyle(color: Colors.blue,fontSize: 30.0, fontWeight: FontWeight.bold )),
      SizedBox(height:50.0),
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
                    'ADULTO',
                    style: TextStyle(color: Colors.red,fontSize: 30.0, fontWeight: FontWeight.bold ),
                  ),
                ],),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => new AtendeColunaAdulto(),
                  ),
                );
              },
            ),
          )
      ),
      Text(
        "Atendimento para Adultos" ,
        style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[700],fontSize: 20.0),
      ),
      SizedBox(height:50.0),
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
                    'INFANTIL',
                    style: TextStyle(color: Colors.red,fontSize: 30.0, fontWeight: FontWeight.bold ),
                  ),
                ],),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => new AtendeColunaInfantil(),
                  ),
                );
              },
            ),
          )
      ),
      Text(
        "Atendimento para crianças" ,
        style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[700],fontSize: 20.0),
      ),
          ],
        ),
      ),
    );
  }
}
