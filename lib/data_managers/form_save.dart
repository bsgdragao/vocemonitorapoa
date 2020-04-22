import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';



class FormSaveData extends StatelessWidget {
  final int idHospital;
  const FormSaveData({Key key, @required this.idHospital}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //Instancia do Database Firebase
    final DatabaseReference _database = FirebaseDatabase.instance.reference();

    //Controle para salvar o comentário
    final comentarioSave = TextEditingController();

    //Variaveis
    int _reference;
    DateTime _date;
    String _email;
    String _esperaT;
    String _comentario;
    String _timeZone;
    bool confirmSend = true;

    // Lê o tempo salvo n o DropDown
    void readTime() async {
      final prefs = await SharedPreferences.getInstance();
      final key = 'tempoEspera';
      final value = prefs.getString(key) ?? null;
      _esperaT = value;
      print('Valor lido no Shared para espera: $value');
      print('Valor salvo em espera: $_esperaT');
    }

    //Salva o comentário do form
    void saveComentario(var comentario) async {
      final prefs = await SharedPreferences.getInstance();
      final key = 'comentario';
      final value = comentario;
      prefs.setString(key, value);
      // Gera log de gravação da variavel
      //print('Valor do comentario salvo no Shared $value');
    }

    // Lê o comentário do form
    void readComentario() async {
      final prefs = await SharedPreferences.getInstance();
      final key = 'comentario';
      final value = prefs.getString(key) ?? null;
      _comentario = value;
      print('Valor lido no Shared para cometário: $value');
      print('Valor salvo no _comentario: $_comentario');
    }

    // Função que garante que os dados são os atualizados
    Future<void> atualizaVariaveis() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      _reference = idHospital;
      print("$_reference essa é a referência");
      DateTime tempoUtc = DateTime.now();
      _date = tempoUtc.toLocal();
      print(_date);
      _email = prefs.get('userEmail');
      print(_email);
      print(_esperaT);
      print(_comentario);
    }

    // Limpeza do tempo e comentario do Shared
    void clearShared() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('tempoEspera', null);
      _esperaT = preferences.get('tempoEspera');
      preferences.setString('comentario', null);
      _comentario = preferences.get('cometario');
      // Imprimi as saidas para validação
      print('Tempo na saida é: $_esperaT \nComentario na saida é: $_comentario');
    }

    // Alert de agradecimento
    showAlert(BuildContext context){
      // configura o button
      Widget okButton = FlatButton(
        child: Text("OK"),
        onPressed: () {
          clearShared();
          Navigator.pop(context, true);
              Navigator.pop(context);
        },
      );
      // configura o  AlertDialog
      AlertDialog alerta = AlertDialog(
        title: Text("Obrigado por participar!"),
        content: Text("A sua ajuda é fundamental para manter o App funcionando! "
            "Mantenha o tempo de espera atualizado e se puder comente. E mais uma vez obrigado por ajudar!"),
        actions: [
            okButton,
        ],
      );
      // exibe o dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alerta;
        },
      );
    }

    // Alert de erro ao selecionar tempo
    showAlertError(BuildContext context){
      // configura o button
      Widget okButton = FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.pop(context, true);

        },
      );
      // configura o  AlertDialog
      AlertDialog alerta = AlertDialog(
        title: Text("Tempo é Obrigatório!"),
        content: Text("Para participar informe corretamente o tempo de espera atual!"),
        actions: [
          okButton,
        ],
      );
      // exibe o dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alerta;
        },
      );
    }

    // Alerta de erro ao sdalvar os dados na cloud
    showAlertErrorSend(BuildContext context){
      // configura o button
      Widget okButton = FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.pop(context, true);

        },
      );
      // configura o  AlertDialog
      AlertDialog alerta = AlertDialog(
        title: Text("Erro ao enviar!"),
        content: Text("Pode ser problemas com a sua internet ou nossa rede! Tente novamente."),
        actions: [
          okButton,
        ],
      );
      // exibe o dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alerta;
        },
      );
    }

    // Envia alerta se o comentario foi enviado
    void enviaMensagem(bool teste){
      print('Bool confirm entrou no EnviaMensagem: $teste');
      if(teste == true){
        showAlert(context);
      }else{
        showAlertErrorSend(context);
      }
    }

    // Envia o comentario para o Firebase
    void sendRecord() {
      //Garante o formato dos dados para envio como String e keys limpos
      print('Entrou no sendRecord');
      // Referencia do hospital para String
      String ref = idHospital.toString();
      // Define a variavel do tempo
      String refT = ref + "1";
      // DateTime para string
      String aData = _date.toString();
      // Limpeza dos dos milisegundos do date time
      String result = aData.substring(0, aData.indexOf('.'));
      // Retorno do valor da String limpo
      aData = result;
      // Email do Usuário
      String oEmail = _email;
      // Remoção do @ do email para uso como Key
      String emailKey = _email.replaceAll('@', '');
      // Remoção doponto do email para uso como Key
      emailKey = emailKey.replaceAll('.', '');
      // Tempo de espera informado pelo User
      String oTempo = _esperaT;
      // Comentario do usuario
      String oComentario = _comentario;
      // Imprime as variaveis enviadas.
      print('Referencia: $ref \n referencia do tempo $refT \n Data: $aData \n Email: $oEmail \n Email Key: $emailKey \n O tempo: $oTempo \n O comentario: $oComentario \n No Send record o Bool confirm entrou $confirmSend');
          // Envia somente o tempo para ser sobrescrito do Hospital
          _database.child("$refT").set({
            'Espera': oTempo,
          });
          // Envia todo o formulário para o registro do usuário.
          _database.child("$ref").child(emailKey).child(aData).set({
            'Data': aData,
            'E-mail': oEmail,
            'Espera': oTempo,
            'Comentario': oComentario,
          }).catchError((e) {
            print('Erro ao enviar avaliação: $e');
            confirmSend = false;
            print('O bool confirm foi trocado no catch exception para: $confirmSend');
          });
      sleep(const Duration(seconds:1));
      enviaMensagem(confirmSend);
    }

    // Valida se o usuário selecionou um tempo
    Future<void> valideDados() async {
      String tempo;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      tempo = prefs.getString('tempoEspera');

      if( tempo != "TEMPO" && tempo != null ){
        sendRecord();

      }else{
        showAlertError(context);
      }
    }

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
                  child: Text('Qual o tempo de atendimento atual?',
                    textAlign: TextAlign.center,  style: TextStyle(color: Colors.blue, fontSize: 20.0),),
                ),
                SizedBox(height: 10.0),
                MyStatefulWidget(),
                SizedBox(height: 30.0),
                new Container(
                  alignment: Alignment.centerLeft,
                  child: Text('Como está o atendimento ai?', style: TextStyle(color: Colors.blue, fontSize: 20.0),),
                ),
                SizedBox(height: 10.0),
                Builder(
                  builder: (context) => Form(
                    child: new TextFormField(
                     textAlign: TextAlign.left,
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
                     onChanged: (value) {
                       saveComentario(value);
                       // Ver a variavel sendo atualizada em tempo real
                       //print('Comentario digitado no Shared $value');
                     },
                     ),
                    ),
                  ),
                new RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.blue[700],
                  child: new Text('    Enviar    ', style: new TextStyle(color: Colors.white,fontSize: 20.0),),
                  onPressed:( ){
                    readTime();
                    readComentario();
                    atualizaVariaveis();
                    valideDados();
                  },
                ),
                SizedBox(height: 10.0),
                new Container(
                  alignment: Alignment.centerLeft,
                  child: Text('Ajude a comunidade! \n Só informe um tempo menor se realmente foi atendido em menos tempo do que o tempo de espera informado.',
                    textAlign: TextAlign.center,  style: TextStyle(color: Colors.blue[700], fontSize: 20.0),),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }

  void setState(Null Function() param0) {}
}

class SaveTime{
  String time;
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'TEMPO';

  _saveTime(var time) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'tempoEspera';
    final value = time;
    prefs.setString(key, value);
    print('Valor do tempo no Shared $value');
  }
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
          _saveTime(newValue);
        });
                print('DropDown no Change: $dropdownValue ');
      },
      items: <String>['TEMPO', '15 Min', '20 Min', '25 Min', '30 Min', '35 Min', '40 Min', '45 Min',
      '50 Min', '55 Min', '1 Hora', '1H 30Min', '2H', '2H 30Min', '3H', '3H 30Min',
      '4H', '4H 30Min', '5H', '5H 30Min', '6', '6H 30Min', '7', '7H 30Min', '8', '+ de 8H']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }


}


