import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:maps_launcher/maps_launcher.dart';


class AtendeColunaInfantil extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Widget timeWidget(String idHosp) {
      return StreamBuilder(
          stream: FirebaseDatabase.instance
              .reference().child(idHosp)
              .onValue,
          builder: (BuildContext context, AsyncSnapshot<Event> snapshot) {
            if (snapshot.hasData) {
              Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
              //map.forEach((dynamic, v) => print(v[dynamic]));
              return new ListView.builder(
                shrinkWrap: true,
                itemCount: map.length,
                itemBuilder: (BuildContext context, var index) {
                  String key = map.keys.elementAt(index);
                  return new Column(
                    children: <Widget>[
                      new ListTile(
                        title: new AutoSizeText("Espera: ${map[key].toString().replaceAll("}", "").trim().replaceAll('{', '')}", style: TextStyle(color: Colors.yellow[700], fontWeight: FontWeight.bold),textAlign: TextAlign.left),
                      ),
                      new Divider(
                        height: 1.0,
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
            title: Text("Atende Coluna Infantil: "),
          ),
          body:  new Container(
            padding: new EdgeInsets.fromLTRB(10.0, 0.6, 0.6, 10.0),
            child: new Center(
              child: new ListView(
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    AutoSizeText('Sekecione um hospital...',
                      style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.w900),minFontSize: 18.0,),
                    SizedBox(height: 20.0),

                    // Hospital de clinicas Pediatria
                    new InkWell(
                      child: new Row(
                        children: <Widget>[
                          new Image.asset('assets/hospitais/clinicasp.png',
                              fit: BoxFit.cover,
                              width: 95.0,
                              height: 95.0
                          ),
                          new Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: <Widget>[
                              new AutoSizeText(' Hospital de Clinicas - PEDIATRIA',
                                style: TextStyle( color: Colors.blue[600], fontWeight: FontWeight.w900),),
                              new AutoSizeText(' Largo Teodoro Herzl s/nº \n  Bom Fim, Porto Alegre', style: TextStyle( color: Colors.blue[600]),),
                              new AutoSizeText(' Tempo de espera dos usuários: ', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                              new Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(width: 300, child: timeWidget("31"),),
                                    ],
                                  ),
                                ],
                              ) ,
                            ],
                          ),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      splashColor: Colors.blue,
                      onTap: ()  => MapsLauncher
                          .launchQuery('Largo Teodoro Herzl s/nº, Bom Fim, Porto Alegre'),
                    ),
                    SizedBox(height: 10.0),

                    // Hospital Hospital Materno Infantil Presidente Vargas
                    new InkWell(
                      child: new Row(
                        children: <Widget>[
                          new Image.asset('assets/hospitais/vargas.png',
                              fit: BoxFit.cover,
                              width: 95.0,
                              height: 95.0
                          ),
                          new Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: <Widget>[
                              new AutoSizeText(' Hospital Materno Infantil Presidente Vargas',
                                style: TextStyle( color: Colors.blue[600], fontWeight: FontWeight.w900),),
                              new AutoSizeText(' Av. Independência, 661 \n Independência, Porto Alegre', style: TextStyle( color: Colors.blue[600]),),
                              new AutoSizeText(' Tempo de espera dos usuários: ', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                              new Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(width: 300, child: timeWidget("51"),),
                                    ],
                                  ),
                                ],
                              ) ,
                            ],
                          ),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      splashColor: Colors.blue,
                      onTap: ()  => MapsLauncher
                          .launchQuery('Avenida Independência, 661, Independência, Porto Alegre'),
                    ),
                    SizedBox(height: 10.0),

                    // Hospital Nossa Senhora da Conceição Pediatria
                    new InkWell(
                      child: Row(
                        children: <Widget>[
                          new Image.asset('assets/hospitais/hnscp.png',
                              fit: BoxFit.cover,
                              width: 95.0,
                              height: 95.0
                          ),
                          new Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: <Widget>[
                              new AutoSizeText(' Hospital Conceição - PEDIATRIA',
                                style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.w900),),
                              new AutoSizeText(' Rua Álvares Cabral, 653 \n Cristo Redentor - Porto Alegre', style: TextStyle(color: Colors.blue[600]),),
                              new AutoSizeText(' Tempo de espera dos usuários: ', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                              new Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(width: 300, child: timeWidget("71"),),
                                    ],
                                  ),
                                ],
                              ) ,
                            ],
                          ),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      splashColor: Colors.blue,
                      onTap: ()  => MapsLauncher
                          .launchQuery('Rua Álvares Cabral, 653, Cristo Redentor - Porto Alegre'),
                    ),
                    SizedBox(height: 10.0),

                    // Hospital Pronto Socorro
                    new InkWell(
                      child: new Row(
                        children: <Widget>[
                          new Image.asset('assets/hospitais/pronto_socorro.png',
                              fit: BoxFit.cover,
                              width: 95.0,
                              height: 95.0
                          ),
                          new Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: <Widget>[
                              new AutoSizeText(' Hospital Pronto Socorro (HPS)',
                                style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.w900),),
                              new AutoSizeText('  Largo Teodoro Herzl s/nº \n  Bom Fim, Porto Alegre', style: TextStyle( color: Colors.blue[600]),),
                              new AutoSizeText(' Tempo de espera dos usuários: ', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                              new Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(width: 300, child: timeWidget("81"),),
                                    ],
                                  ),
                                ],
                              ) ,
                            ],
                          ),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      splashColor: Colors.blue,
                      onTap: ()  => MapsLauncher
                          .launchQuery('Largo Teodoro Herzl s/nº, Bom Fim, Porto Alegre'),
                    ),
                    SizedBox(height: 10.0),

                    // Hospital da Restinga Pediatria
                    new InkWell(
                      child: new Row(
                        children: <Widget>[
                          new Image.asset('assets/hospitais/restingap.png',
                              fit: BoxFit.cover,
                              width: 95.0,
                              height: 95.0
                          ),
                          new Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: <Widget>[
                              new AutoSizeText(' Hospital da Restinga PEDIATRIA',
                                style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.w900),),
                              new AutoSizeText(' Estrada João Antônio da Silveira, 3700 \n Restinga, Porto Alegre', style: TextStyle(color: Colors.blue[600]),),
                              new AutoSizeText(' Tempo de espera dos usuários: ', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                              new Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(width: 300, child: timeWidget("101"),),
                                    ],
                                  ),
                                ],
                              ) ,
                            ],
                          ),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      splashColor: Colors.blue,
                      onTap: ()  => MapsLauncher
                          .launchQuery('Estrada João Antônio da Silveira, 3700, Restinga, Porto Alegre'),
                    ),
                    SizedBox(height: 10.0),

                    // Hospital Santo Antônio
                    new InkWell(
                      child: new Row(
                        children: <Widget>[
                          new Image.asset('assets/hospitais/santo_antonio.png',
                              fit: BoxFit.cover,
                              width: 95.0,
                              height: 95.0
                          ),
                          new Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: <Widget>[
                              new AutoSizeText(' Hospital Santo Antônio (HSA)',
                                style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.w900),),
                              new AutoSizeText('  Rua Professor Annes Dias, 295 \n Centro Histórico, Porto Alegre', style: TextStyle(color: Colors.blue[600]),),
                              new AutoSizeText(' Tempo de espera dos usuários: ', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                              new Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(width: 300, child: timeWidget("121"),),
                                    ],
                                  ),
                                ],
                              ) ,
                            ],
                          ),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      splashColor: Colors.blue,
                      onTap: ()  => MapsLauncher
                          .launchQuery('Rua Professor Annes Dias, 295, Centro Histórico, Porto Alegre'),
                    ),
                    SizedBox(height: 10.0),

                    // Hospital São Lucas - Pediatria SUS
                    new InkWell(
                      child: new Row(
                        children: <Widget>[
                          new Image.asset('assets/hospitais/sao_lucasp.png',
                              fit: BoxFit.cover,
                              width: 95.0,
                              height: 95.0
                          ),
                          new Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: <Widget>[
                              new AutoSizeText(' São Lucas - PEDIATRIA SUS',
                                style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.w900),),
                              new AutoSizeText(' Av. Ipiranga, 6690 \n Jardim Botânico, Porto Alegre', style: TextStyle(color: Colors.blue[600]),),
                              new AutoSizeText(' Tempo de espera dos usuários: ', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                              new Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(width: 300, child: timeWidget("151"),),
                                    ],
                                  ),
                                ],
                              ) ,
                            ],
                          ),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      splashColor: Colors.blue,
                      onTap: ()  => MapsLauncher
                          .launchQuery('Avenida Ipiranga, 6690, Jardim Botânico, Porto Alegre'),
                    ),
                    SizedBox(height: 10.0),
                  ]
              ),
            ),
          ),
        )
    );
  }
}
