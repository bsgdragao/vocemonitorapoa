import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ValoresDeEspera {
  final DatabaseReference _dataTime = FirebaseDatabase.instance.reference();

  var dataTime;
  String tempoNo1, tempoNo2, tempoNo3, tempoNo4,
      tempoNo5, tempoNo6, tempoNo7, tempoNo8, tempoNo9,
      tempoNo10, tempoNo11, tempoNo12, tempoNo13, tempoNo14;

  _getTimeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _dataTime.child('11').once().then((DataSnapshot snapshot) {
      dataTime = snapshot.value;
      String temp = dataTime.toString();
      //print('\n1º o temp: é $temp');
      temp = temp.replaceAll('{', '');
      //print('\n2º o temp: é $temp');
      temp = temp.replaceAll('}', '');
      //print('\n3º o temp: é $temp');
      prefs.setString('TempoEsperaShar', temp);
      //print('\nNo getTime o datetime é $dataTime e o temp: é $temp');
      print('Variavel temp no getTime é: $temp');

    });
  }
}

