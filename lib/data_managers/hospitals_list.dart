import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vocemonitorapoa/hospitais_pages/hospital_pages.dart';

class HospitalsList extends StatefulWidget {
  @override
  _HospitalsListState createState() => _HospitalsListState();
}

class _HospitalsListState extends State<HospitalsList> {
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
        title: AutoSizeText("Selecione um hospital para: "),
               ),
          body:  new Container(
            padding: new EdgeInsets.fromLTRB(10.0, 0.6, 0.6, 10.0),
            child: new Center(
              child: new ListView(
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    AutoSizeText('Avaliar o tempo de espera...',
                      style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.w900),minFontSize: 18.0,),
                    SizedBox(height: 20.0),

                    // Instituto de Cardiologia
                    new InkWell(
                        child: new Row(
                          children: <Widget>[
                            new Image.asset( 'assets/hospitais/cardiologia.png',
                                fit: BoxFit.cover,
                                width: 95.0,
                                height: 95.0
                            ),
                            new Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: <Widget>[
                                new AutoSizeText(' Instituto de Cardiologia (IC)',
                                  style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.w900),),
                                new AutoSizeText(' Av. Princesa Isabel, 395 \n Santana, Porto Alegre', style: TextStyle(color: Colors.blue[600]),),
                                new Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 300, child: timeWidget("11"),),
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
                        onTap:(){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HospitalPages(idHospital: 1,nameHospital: "Instituto de Cardiologia",trackImage: 'assets/hospitais/cardiologia.png',),),);
                        }
                    ),

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
                        onTap: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HospitalPages(idHospital: 2, nameHospital: "Hospital de Clinicas", trackImage: 'assets/hospitais/clinicas.png'),),);
                        }
                    ),
                    SizedBox(height: 10.0),

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
                        onTap: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HospitalPages(idHospital: 3,nameHospital: 'Hospital de Clinicas - PEDIATRIA',trackImage: 'assets/hospitais/clinicasp.png'),),);
                        }
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
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HospitalPages(idHospital: 4,nameHospital: 'Hospital Cristo Redentor',trackImage: 'assets/hospitais/cristo_redentor.png',)),
                          );
                        }
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
                                new AutoSizeText(' Hospital Materno Infantil\n Presidente Vargas',
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
                        onTap: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HospitalPages(idHospital: 5,nameHospital: 'Hospital Materno Infantil Presidente Vargas',trackImage: 'assets/hospitais/vargas.png',),),);
                        }
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
                        onTap: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HospitalPages(idHospital: 6, nameHospital: 'Hospital Conceição', trackImage: 'assets/hospitais/hnsc.png'),),);
                        }
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
                        onTap: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HospitalPages(idHospital: 7, nameHospital: 'Hospital Conceição - PEDIATRIA', trackImage: 'assets/hospitais/hnscp.png'),),);
                        }
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
                        onTap: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HospitalPages(idHospital: 8, nameHospital: 'Hospital Pronto Socorro (HPS)', trackImage: 'assets/hospitais/pronto_socorro.png'),),);
                        }
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
                        onTap: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HospitalPages(idHospital: 9, nameHospital: 'Hospital da Restinga', trackImage: 'assets/hospitais/restinga.png'),),);
                        }
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
                        onTap: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HospitalPages(idHospital: 10, nameHospital: 'Hospital da Restinga PEDIATRIA', trackImage: 'assets/hospitais/restingap.png'),),);
                        }
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
                        onTap: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HospitalPages(idHospital: 12, nameHospital: 'Hospital Santo Antônio (HSA)', trackImage: 'assets/hospitais/santo_antonio.png'),),);
                        }
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
                        onTap: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HospitalPages(idHospital: 13, nameHospital: 'Santa Casa - SUS', trackImage: 'assets/hospitais/santa_casa.png'),),);
                        }
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
                        onTap: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HospitalPages(idHospital: 14, nameHospital: 'Hospital São Lucas - SUS', trackImage: 'assets/hospitais/sao_lucas.png'),),);
                        }
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
                        onTap: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HospitalPages(idHospital: 15, nameHospital: 'Hospital São Lucas - PEDIATRIA SUS', trackImage: 'assets/hospitais/sao_lucasp.png'),),);
                        }
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
                        onTap: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HospitalPages(idHospital: 16, nameHospital: 'UPA - Bom Jesus', trackImage: 'assets/hospitais/bomjesus.png'),),);
                        }
                    ),
                    SizedBox(height: 10.0),
                    // Unidade Pronto Atendimento Bom Jesus Pediatria
                    new InkWell(
                        child: new Row(
                          children: <Widget>[
                            new Image.asset('assets/hospitais/bomjesusp.png',
                                fit: BoxFit.cover,
                                width: 95.0,
                                height: 95.0
                            ),
                            new Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: <Widget>[
                                new AutoSizeText(' UPA - Bom Jesus PEDIATRIA',
                                  style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.w900),),
                                new AutoSizeText(' R. Bom Jesus, 410 \n Bom Jesus, Porto Alegre', style: TextStyle(color: Colors.blue[600]),),
                                new AutoSizeText(' Tempo de espera dos usuários: ', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                                new Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 300, child: timeWidget("171"),),
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
                        onTap: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HospitalPages(idHospital: 17, nameHospital: 'UPA - Bom Jesus PEDIATRIA', trackImage: 'assets/hospitais/bomjesusp.png'),),);
                        }
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
                        onTap: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HospitalPages(idHospital: 18, nameHospital: 'UPA - Cruzeiro do Sul', trackImage: 'assets/hospitais/cruzeiro.png'),),);
                        }
                    ),
                    SizedBox(height: 10.0),

                    // Unidade Pronto Atendimento da Cruzeiro do Sul Pediatria
                    new InkWell(
                        child: new Row(
                          children: <Widget>[
                            new Image.asset('assets/hospitais/cruzeirop.png',
                                fit: BoxFit.cover,
                                width: 95.0,
                                height: 95.0
                            ),
                            new Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: <Widget>[
                                new AutoSizeText(' UPA - Cruzeiro do Sul PEDIATRIA',
                                  style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.w900),),
                                new AutoSizeText(' R. Prof. Manoel Lobato, 151 \n Santa Tereza, Porto Alegre ', style: TextStyle(color: Colors.blue[600]),),
                                new AutoSizeText(' Tempo de espera dos usuários: ', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                                new Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 300, child: timeWidget("191"),),
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
                        onTap:() {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HospitalPages(idHospital: 19, nameHospital: 'UPA - Cruzeiro do Sul PEDIATRIA', trackImage: 'assets/hospitais/cruzeirop.png'),),);
                        }
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
                        onTap: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HospitalPages(idHospital: 20, nameHospital: 'UPA - Lomba do Pinheiro', trackImage: 'assets/hospitais/lomba.png'),),);
                        }
                    ),
                    SizedBox(height: 10.0),

                    // Unidade Pronto Atendimento da Lomba do Pinheiro Pediatria
                    new InkWell(
                        child: new Row(
                          children: <Widget>[
                            new Image.asset('assets/hospitais/lombap.png',
                                fit: BoxFit.cover,
                                width: 95.0,
                                height: 95.0
                            ),
                            new Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: <Widget>[
                                new AutoSizeText(' UPA - Lomba do Pinheiro PEDIATRIA',
                                  style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.w900),),
                                new AutoSizeText(' Estr. João de Oliveira Remião, 5110 \n Lomba do Pinheiro, Porto Alegre ', style: TextStyle(color: Colors.blue[600]),),
                                new AutoSizeText(' Tempo de espera dos usuários: ', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                                new Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 300, child: timeWidget("221"),),
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
                        onTap: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HospitalPages(idHospital: 22, nameHospital: 'UPA - Lomba do Pinheiro PEDIATRIA', trackImage: 'assets/hospitais/lombap.png'),),);
                        }
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
                        onTap: ()  {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HospitalPages(idHospital: 23, nameHospital: 'UPA - Moacyr Scliar', trackImage: 'assets/hospitais/moacyr.png'),),);
                        }
                    ),
                    SizedBox(height: 10.0),

                    // Unidade Pronto Atendimento Moacyr Scliar Pediatria
                    new InkWell(
                        child: new Row(
                          children: <Widget>[
                            new Image.asset('assets/hospitais/moacyrp.png',
                                fit: BoxFit.cover,
                                width: 95.0,
                                height: 95.0
                            ),
                            new Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: <Widget>[
                                new AutoSizeText(' UPA - Moacyr Scliar PEDIATRIA',
                                  style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.w900),),
                                new AutoSizeText(' R. Jerônymo Zelmanovitz, 01 \n São Sebastião, Porto Alegre ', style: TextStyle(color: Colors.blue[600]),),
                                new AutoSizeText(' Tempo de espera dos usuários: ', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                                new Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 300, child: timeWidget("241"),),
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
                        onTap: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HospitalPages(idHospital: 24, nameHospital: 'UPA - Moacyr Scliar PEDIATRIA', trackImage: 'assets/hospitais/moacyrp.png'),),);
                        }
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
