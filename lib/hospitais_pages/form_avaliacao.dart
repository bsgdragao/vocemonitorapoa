import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FormAvaliacao extends StatelessWidget {
  final databaseReference = FirebaseDatabase.instance.reference();

  int _reference;
  DateTime _date;
  String _email;
  int _espera;
  String _comentario;


  void sendRecord() {
    databaseReference.child("$_reference").set({
      'Data': '$_date',
      'E-mail': '$_email',
      'Espera' : '$_espera',
      'Comentario' : '$_comentario',
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: new Scaffold(
       appBar: AppBar(

       ),
     body: new Container(
       child: new InkWell(
         child: new Column(
           children: [
             new TextFormField(
               decoration: new InputDecoration(labelText: 'Quer fazer um comentário?' ),
               onSaved: (value) => _comentario = value,
             ),
           ],
         ),
       ),
     ) ,
      ),
    );
  }
}

  class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
  }

  class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  title: Text("DropDownButton"),
  backgroundColor: Colors.red,
  ),
  body: criaDropDownButton(),
  );
  }
  criaDropDownButton() {
  }
  }
