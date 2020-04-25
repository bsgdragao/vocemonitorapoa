import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:maps_launcher/maps_launcher.dart';


class AtendeColunaAdulto extends StatelessWidget {

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
            title: Text("Atende Coluna: "),
          ),
          body:  new Container(
            padding: new EdgeInsets.fromLTRB(10.0, 0.6, 0.6, 10.0),
            child: new Center(
              child: new ListView(
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    AutoSizeText('Selecione um hospital...',
                      style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.w900),minFontSize: 18.0,),
                    SizedBox(height: 20.0),

                    // Hospital de clinicas
                    new InkWell(
                      child: new Row(
                        children: <Widget>[
                          new Image.asset('assets/hospitais/clinicas.png',
                              fit: BoxFit.cover,
                              width: 95.0,
                              height: 95.0
                          ),
                          new Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: <Widget>[
                              new AutoSizeText(' Hospital de Clinicas (HCPA)',
                                style: TextStyle( color: Colors.blue[600], fontWeight: FontWeight.w900),),
                              new AutoSizeText(' Largo Teodoro Herzl s/nº \n  Bom Fim, Porto Alegre', style: TextStyle( color: Colors.blue[600]),),
                              new AutoSizeText(' Tempo de espera dos usuários: ', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                              new Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(width: 300, child: timeWidget("21"),),
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
                          .launchQuery('Largo Teodoro Herzl s/nº,  Bom Fim, Porto Alegre'),
                    ),
                    SizedBox(height: 10.0),

                    // Hospital Cristo Redentor (HCR)
                    new InkWell(
                      child: new Row(
                          children: <Widget>[
                            new Image.asset('assets/hospitais/cristo_redentor.png',
                                fit: BoxFit.cover,
                                width: 95.0,
                                height: 95.0
                            ),
                            new Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: <Widget>[
                                new AutoSizeText(' Hospital Cristo Redentor (HCR)',
                                  style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.w900),),
                                new AutoSizeText(' Rua Domingos Rubbo, 20 \n Cristo Redentor, Porto Alegre', style: TextStyle(color: Colors.blue),),
                                new AutoSizeText(' Tempo de espera dos usuários: ', style: TextStyle( color: Colors.blue, fontWeight: FontWeight.bold),),
                                new Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 300, child: timeWidget("41"),),
                                      ],
                                    ),
                                  ],
                                ) ,
                              ],
                            ),
                          ]
                      ),
                      borderRadius: BorderRadius.circular(20),
                      splashColor: Colors.blue,
                      onTap: ()  => MapsLauncher
                          .launchQuery('Rua Domingos Rubbo, 20, Cristo Redentor, Porto Alegre'),
                    ),
                    SizedBox(height: 10.0),

                    // Hospital Nossa Senhora da Conceição
                    new InkWell(
                      child: new Row(
                        children: <Widget>[
                          new Image.asset('assets/hospitais/hnsc.png',
                              fit: BoxFit.cover,
                              width: 95.0,
                              height: 95.0
                          ),
                          new Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: <Widget>[
                              new AutoSizeText(' Hospital Conceição (HNSC)',
                                style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.w900),),
                              new AutoSizeText(' Av. Francisco Trein, 596 \n Cristo Redentor, Porto Alegre', style: TextStyle(color: Colors.blue[600]),),
                              new AutoSizeText(' Tempo de espera dos usuários: ', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                              new Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(width: 300, child: timeWidget("61"),),
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
                          .launchQuery('Av. Francisco Trein, 596, Cristo Redentor, Porto Alegre'),
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

                    // Hospital da Restinga
                    new InkWell(
                      child: new Row(
                        children: <Widget>[
                          new Image.asset('assets/hospitais/restinga.png',
                              fit: BoxFit.cover,
                              width: 95.0,
                              height: 95.0
                          ),
                          new Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: <Widget>[
                              new AutoSizeText(' Hospital da Restinga (HR)',
                                style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.w900),),
                              new AutoSizeText(' Estrada João Antônio da Silveira, 3700 \n Restinga, Porto Alegre', style: TextStyle(color: Colors.blue[600]),),
                              new AutoSizeText(' Tempo de espera dos usuários: ', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                              new Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(width: 300, child: timeWidget("91"),),
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

                    // Hospital Santa Casa
                    new InkWell(
                      child: new Row(
                        children: <Widget>[
                          new Image.asset('assets/hospitais/santa_casa.png',
                              fit: BoxFit.cover,
                              width: 95.0,
                              height: 95.0
                          ),
                          new Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: <Widget>[
                              new AutoSizeText(' Santa Casa - SUS',
                                style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.w900),),
                              new AutoSizeText(' Av. Independência, 155 \n Independência, Porto Alegre', style: TextStyle(color: Colors.blue[600]),),
                              new AutoSizeText(' Tempo de espera dos usuários: ', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                              new Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(width: 300, child: timeWidget("131"),),
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
                          .launchQuery('Avenida Independência, 155, Independência, Porto Alegre'),
                    ),
                    SizedBox(height: 10.0),

                    // Hospital São Lucas - SUS
                    new InkWell(
                      child: new Row(
                        children: <Widget>[
                          new Image.asset('assets/hospitais/sao_lucas.png',
                              fit: BoxFit.cover,
                              width: 95.0,
                              height: 95.0
                          ),
                          new Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: <Widget>[
                              new AutoSizeText(' São Lucas - SUS',
                                style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.w900),),
                              new AutoSizeText(' Av. Ipiranga, 6690 \n Jardim Botânico, Porto Alegre', style: TextStyle(color: Colors.blue[600]),),
                              new AutoSizeText(' Tempo de espera dos usuários: ', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                              new Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(width: 300, child: timeWidget("141"),),
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
                      onTap:()  => MapsLauncher
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
