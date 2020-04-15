import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class FormSaveData extends StatelessWidget {
  final int idHospital;
  const FormSaveData({Key key, @required this.idHospital}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String comentario;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        title: Text("Avalie o tempo de espera:"),
        ),
        body: Container(
          padding: EdgeInsets.all(14.0),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 30.0),
                new Container(
                  alignment: Alignment.centerLeft,
                  child: Text('Qual o tempo de atendimento atual?',  style: TextStyle(color: Colors.blue, fontSize: 20.0),),
                ),
                SizedBox(height: 10.0),
                MyStatefulWidget(),
                SizedBox(height: 30.0),
                new Container(
                  alignment: Alignment.centerLeft,
                  child: Text('Como está o atendimento ai?', style: TextStyle(color: Colors.blue, fontSize: 20.0),),
                ),
                SizedBox(height: 10.0),
                new TextFormField(
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  maxLength: 200,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: new InputDecoration(labelText: 'Digite aqui seu comentário:',
                    //contentPadding: new EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: new BorderSide(),),),
                  onSaved: (value) => comentario = value,
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}


class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = '15 Min';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 30,
      elevation: 26,
      style: TextStyle(color: Colors.blue[600], fontSize: 20.0),
      underline: Container(
        height: 4,
        color: Colors.blue[700],
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['15 Min', '20 Min', '25 Min', '30 Min', '35 Min', '40 Min', '45  Min',
      '50 Min', '55 Min', '1 Hora', '1H 30Min', '2H', '2H 30Min', '3H 00Min', '3H 30Min',
      '4H', '4H 30MIN', '5H', '5H 30MIN', '6', '6H 30MIN', '7', '7H 30MIN', '8', '+ de 8H']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}