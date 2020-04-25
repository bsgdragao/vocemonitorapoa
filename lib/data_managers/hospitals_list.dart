import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vocemonitorapoa/hospitais_pages/hospital_clinicas.dart';
import 'package:vocemonitorapoa/hospitais_pages/hospital_clinicas_pediatria.dart';
import 'package:vocemonitorapoa/hospitais_pages/hospital_crianca_conceicao.dart';
import 'package:vocemonitorapoa/hospitais_pages/hospital_cristo_redentor.dart';
import 'package:vocemonitorapoa/hospitais_pages/hospital_hnsc.dart';
import 'package:vocemonitorapoa/hospitais_pages/hospital_presidente_vargas.dart';
import 'package:vocemonitorapoa/hospitais_pages/hospital_pronto_socorro.dart';
import 'package:vocemonitorapoa/hospitais_pages/hospital_restinga.dart';
import 'package:vocemonitorapoa/hospitais_pages/hospital_restinga_pediatria.dart';
import 'package:vocemonitorapoa/hospitais_pages/hospital_santo_antonio.dart';
import 'package:vocemonitorapoa/hospitais_pages/ic_fuc.dart';
import 'package:vocemonitorapoa/hospitais_pages/pa_bom_jesus.dart';
import 'package:vocemonitorapoa/hospitais_pages/pa_bom_jesus_pediatria.dart';
import 'package:vocemonitorapoa/hospitais_pages/pa_cruzeiro.dart';
import 'package:vocemonitorapoa/hospitais_pages/pa_cruzeiro_pediatria.dart';
import 'package:vocemonitorapoa/hospitais_pages/pa_lomba_pinheiro.dart';
import 'package:vocemonitorapoa/hospitais_pages/pa_lomba_pinheiro_pediatria.dart';
import 'package:vocemonitorapoa/hospitais_pages/pa_moacyr_scliar.dart';
import 'package:vocemonitorapoa/hospitais_pages/pa_moacyr_scliar_pediatria.dart';
import 'package:vocemonitorapoa/hospitais_pages/santa_casa.dart';
import 'package:vocemonitorapoa/hospitais_pages/sao_lucas.dart';
import 'package:vocemonitorapoa/hospitais_pages/sao_lucas_pediatria.dart';

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
        title: Text("Selecione um hospital para: "),
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
                            MaterialPageRoute(builder: (context) => InstitutoCardiologia(),),);
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
                            MaterialPageRoute(builder: (context) => HospitalClinicas(),),);
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
                            MaterialPageRoute(builder: (context) => HospitalClinicasPediatria(),),);
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
                            MaterialPageRoute(builder: (context) => HospitalCristo()),
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
                        onTap: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => PresidenteVargas(),),);
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
                            MaterialPageRoute(builder: (context) => HospitalConceicao(),),);
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
                            MaterialPageRoute(builder: (context) => HospitalConceicaoPed(),),);
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
                            MaterialPageRoute(builder: (context) => HospitalProntoSocorro(),),);
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
                            MaterialPageRoute(builder: (context) => HospitalRestinga(),),);
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
                            MaterialPageRoute(builder: (context) => HospitalRestingaPed(),),);
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
                            MaterialPageRoute(builder: (context) => HospitalSantoAntonio(),),);
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
                            MaterialPageRoute(builder: (context) => HospitalSantaCasa(),),);
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
                            MaterialPageRoute(builder: (context) => HospitalSaoLucas(),),);
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
                            MaterialPageRoute(builder: (context) => HospitalSaoLucasPed(),),);
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
                            MaterialPageRoute(builder: (context) => UpaBomJesus(),),);
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
                            MaterialPageRoute(builder: (context) => UpaBomJesusPed(),),);
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
                            MaterialPageRoute(builder: (context) => UpaCruzeiro(),),);
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
                            MaterialPageRoute(builder: (context) => UpaCruzeiroPed(),),);
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
                            MaterialPageRoute(builder: (context) => UpaLomba(),),);
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
                            MaterialPageRoute(builder: (context) => UpaLombaPed(),),);
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
                            MaterialPageRoute(builder: (context) => UpaMoacyr(),),);
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
                            MaterialPageRoute(builder: (context) => UpaMoacyrPed(),),);
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
