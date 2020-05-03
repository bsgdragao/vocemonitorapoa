import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:maps_launcher/maps_launcher.dart';


class AtendeDorBarriga extends StatelessWidget {

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
            title: AutoSizeText("Atende estômago: "),
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

                    // Unidade Pronto Atendimento Bom Jesus
                    new InkWell(
                      child: new Row(
                        children: <Widget>[
                          new Image.asset('assets/hospitais/bomjesus.png',
                              fit: BoxFit.cover,
                              width: 95.0,
                              height: 95.0
                          ),
                          new Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: <Widget>[
                              new AutoSizeText(' UPA - Bom Jesus',
                                style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.w900),),
                              new AutoSizeText(' R. Bom Jesus, 410 \n Bom Jesus, Porto Alegre', style: TextStyle(color: Colors.blue[600]),),
                              new AutoSizeText(' Tempo de espera dos usuários: ', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                              new Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(width: 300, child: timeWidget("161"),),
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
                          .launchQuery('Rua Bom Jesus, 410, Bom Jesus, Porto Alegre'),
                    ),
                    SizedBox(height: 10.0),

                    // Unidade Pronto Atendimento da Cruzeiro do Sul
                    new InkWell(
                      child: new Row(
                        children: <Widget>[
                          new Image.asset( 'assets/hospitais/cruzeiro.png',
                              fit: BoxFit.cover,
                              width: 95.0,
                              height: 95.0
                          ),
                          new Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: <Widget>[
                              new AutoSizeText(' UPA - Cruzeiro do Sul',
                                style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.w900),),
                              new AutoSizeText(' R. Prof. Manoel Lobato, 151 \n Santa Tereza, Porto Alegre ', style: TextStyle(color: Colors.blue[600]),),
                              new AutoSizeText(' Tempo de espera dos usuários: ', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                              new Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(width: 300, child: timeWidget("181"),),
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
                          .launchQuery('Rua Professor Manoel Lobato, 151, Santa Tereza, Porto Alegre'),
                    ),
                    SizedBox(height: 10.0),

                    // Unidade Pronto Atendimento da Lomba do Pinheiro
                    new InkWell(
                      child: new Row(
                        children: <Widget>[
                          new Image.asset('assets/hospitais/lomba.png',
                              fit: BoxFit.cover,
                              width: 95.0,
                              height: 95.0
                          ),
                          new Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: <Widget>[
                              new AutoSizeText(' UPA - Lomba do Pinheiro',
                                style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.w900),),
                              new AutoSizeText(' Estr. João de Oliveira Remião, 5110 \n Lomba do Pinheiro, Porto Alegre ', style: TextStyle(color: Colors.blue[600]),),
                              new AutoSizeText(' Tempo de espera dos usuários: ', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                              new Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(width: 300, child: timeWidget("201"),),
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
                          .launchQuery('Estrada João de Oliveira Remião, 5110, Lomba do Pinheiro, Porto Alegre '),
                    ),
                    SizedBox(height: 10.0),

                    // Unidade Pronto Atendimento Moacyr Scliar
                    new InkWell(
                      child: new Row(
                        children: <Widget>[
                          new Image.asset('assets/hospitais/moacyr.png',
                              fit: BoxFit.cover,
                              width: 95.0,
                              height: 95.0
                          ),
                          new Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: <Widget>[
                              new AutoSizeText(' UPA - Moacyr Scliar',
                                style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.w900),),
                              new AutoSizeText(' R. Jerônymo Zelmanovitz, 01 \n São Sebastião, Porto Alegre ', style: TextStyle(color: Colors.blue[600]),),
                              new AutoSizeText(' Tempo de espera dos usuários: ', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                              new Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(width: 300, child: timeWidget("231"),),
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
                          .launchQuery('Rua Jerônymo Zelmanovitz, 01, São Sebastião, Porto Alegre'),
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
