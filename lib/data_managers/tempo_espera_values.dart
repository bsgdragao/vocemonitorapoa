import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ValoresDeEspera {
  final DatabaseReference _dataTime = FirebaseDatabase.instance.reference();

  var dataTime;
  static List hospList;

  getTimeData(var listaDeEspera) async {

      for(int i = 11; i < 142; i+=10){
        for(int x = 0; x <15; x++ ) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          _dataTime.child(i.toString()).once().then((DataSnapshot snapshot) {
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
            hospList[x] = temp;
            listaDeEspera[x] = temp;
            print('Variavel hospList no getTime é:' + hospList[x]);

          });
        }
      }
      return listaDeEspera;
  }
}

