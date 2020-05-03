import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:vocemonitorapoa/data_managers/form_save.dart';


class HospitalPages extends StatelessWidget {
  final int idHospital;
  final String nameHospital;
  final String trackImage;
  const HospitalPages({Key key, @required this.idHospital, @required this.nameHospital, @required this.trackImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Strings de referencia do hospital
    int refHospital = idHospital;
    String idComentarios = refHospital.toString();
    String idHospitalTime = idComentarios + '1';
    //String com o nome do Hospital
    String nomeHospital = nameHospital;
    String imageRoute = trackImage;

    _comentsWidget() {
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
    _timeWidget() {
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

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
        appBar: AppBar(
        title: AutoSizeText(nomeHospital),
    ),
    body: Column(children: <Widget>[

              Expanded(
                flex: 3,
                child: Image.asset(imageRoute),
              ),
              Expanded(
                flex: 1,
                child: AutoSizeText('Tempo de Espera atual: ', style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.bold),minFontSize: 24.0),
              ),
              Expanded(
                 flex: 1,
                 child: SizedBox(width: MediaQuery.of(context).size.width, child: _timeWidget(),),
             ),
              Expanded(
                flex: 2,
                child:                       new FlatButton(onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new FormSaveData(idHospital: idHospital),),);
                },
                  child: AutoSizeText('Está esperando a mais tempo? '
                      '\nFoi atendido em um tempo menor?'
                      '\nClique e atualize o tempo!\n',
                    textAlign: TextAlign.center, style: TextStyle(
                        color: Colors.lightBlueAccent[200],fontWeight: FontWeight.bold),
                    minFontSize: 20.0,),),),
             Expanded(
               flex: 5,
               child:
               SizedBox(width: MediaQuery.of(context).size.width, child: _comentsWidget()),
             ),
          ],
        ),
      ),
    );
  }
}
