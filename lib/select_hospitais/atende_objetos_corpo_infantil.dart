import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:maps_launcher/maps_launcher.dart';


class AtendeObjetosCorpoInfantil extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Selecione um hospital para: "),
        ),
        body:  new Container(
          padding: new EdgeInsets.all(14.0),
          child: new Center(
            child: new ListView(
                shrinkWrap: true,
                children: <Widget>[
                  AutoSizeText('Clique em um hospital para ver como chegar...',
                    style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.w900),minFontSize: 18.0,),
                  SizedBox(height: 20.0),
                  // Instituto de Cardiologia
                  new InkWell(
                    child: new Row(
                      children: <Widget>[
                        new FadeInImage.assetNetwork(
                            placeholder: 'assets/hospitais/cardiologia.png',
                            image: '',
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
                            new AutoSizeText(' Tempo de espera dos usuários: ', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                            new AutoSizeText('    ' + '      H' + '    M', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold ),),
                          ],
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.blue,
                    onTap: ()  => MapsLauncher
                        .launchQuery('Rua Domingos Rubbo, 20, Cristo Redentor, Porto Alegre'),
                  ),
                  SizedBox(height: 10.0),
                  // Hospital de clinicas
                  new InkWell(
                    child: new Row(
                      children: <Widget>[
                        new FadeInImage.assetNetwork(
                            placeholder: 'assets/hospitais/clinicas.png',
                            image: '',
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
                            new AutoSizeText('    ' + '      H' + '    M', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.blue,
                    onTap: ()  => MapsLauncher
                        .launchQuery('Rua Domingos Rubbo, 20, Cristo Redentor, Porto Alegre'),
                  ),
                  SizedBox(height: 10.0),
                  // Hospital de clinicas Pediatria
                  new InkWell(
                    child: new Row(
                      children: <Widget>[
                        new FadeInImage.assetNetwork(
                            placeholder: 'assets/hospitais/clinicasp.png',
                            image: '',
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
                            new AutoSizeText('    ' + '      H' + '    M', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.blue,
                    onTap: ()  => MapsLauncher
                        .launchQuery('Rua Domingos Rubbo, 20, Cristo Redentor, Porto Alegre'),
                  ),
                  SizedBox(height: 10.0),
                  // Hospital Cristo Redentor (HCR)
                  new InkWell(
                    child: new Row(
                        children: <Widget>[
                          new FadeInImage.assetNetwork(
                              placeholder: 'assets/hospitais/cristo_redentor.png',
                              image: '',
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
                              new AutoSizeText('    ' + '      H' + '    M', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
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
                  // Hospital Hospital Materno Infantil Presidente Vargas
                  new InkWell(
                    child: new Row(
                      children: <Widget>[
                        new FadeInImage.assetNetwork(
                            placeholder: 'assets/hospitais/vargas.png',
                            image: '',
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
                            new AutoSizeText('    ' + '      H' + '    M', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
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
                        new FadeInImage.assetNetwork(
                            placeholder: 'assets/hospitais/hnsc.png',
                            image: '',
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
                            new AutoSizeText('    ' + '      H' + '    M', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.blue,
                    onTap: ()  => MapsLauncher
                        .launchQuery('Rua Domingos Rubbo, 20, Cristo Redentor, Porto Alegre'),
                  ),
                  SizedBox(height: 10.0),
                  // Hospital Nossa Senhora da Conceição Pediatria
                  new InkWell(
                    child: Row(
                      children: <Widget>[
                        new FadeInImage.assetNetwork(
                            placeholder: 'assets/hospitais/hnscp.png',
                            image: '',
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
                            new AutoSizeText('    ' + '      H' + '    M', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.blue,
                    onTap: ()  => MapsLauncher
                        .launchQuery('Rua Domingos Rubbo, 20, Cristo Redentor, Porto Alegre'),
                  ),
                  SizedBox(height: 10.0),
                  // Hospital Pronto Socorro
                  new InkWell(
                    child: new Row(
                      children: <Widget>[
                        new FadeInImage.assetNetwork(
                            placeholder: 'assets/hospitais/pronto_socorro.png',
                            image: '',
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
                            new AutoSizeText('    ' + '      H' + '    M', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.blue,
                    onTap: ()  => MapsLauncher
                        .launchQuery('Rua Domingos Rubbo, 20, Cristo Redentor, Porto Alegre'),
                  ),
                  SizedBox(height: 10.0),
                  // Hospital da Restinga
                  new InkWell(
                    child: new Row(
                      children: <Widget>[
                        new FadeInImage.assetNetwork(
                            placeholder: 'assets/hospitais/restinga.png',
                            image: '',
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
                            new AutoSizeText('    ' + '      H' + '    M', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.blue,
                    onTap: ()  => MapsLauncher
                        .launchQuery('Rua Domingos Rubbo, 20, Cristo Redentor, Porto Alegre'),
                  ),
                  SizedBox(height: 10.0),
                  // Hospital da Restinga Pediatria
                  new InkWell(
                    child: new Row(
                      children: <Widget>[
                        new FadeInImage.assetNetwork(
                            placeholder: 'assets/hospitais/restingap.png',
                            image: '',
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
                            new AutoSizeText('    ' + '      H' + '    M', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.blue,
                    onTap: ()  => MapsLauncher
                        .launchQuery('Rua Domingos Rubbo, 20, Cristo Redentor, Porto Alegre'),
                  ),
                  SizedBox(height: 10.0),
                  // Hospital Santo Antônio
                  new InkWell(
                    child: new Row(
                      children: <Widget>[
                        new FadeInImage.assetNetwork(
                            placeholder: 'assets/hospitais/santo_antonio.png',
                            image: '',
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
                            new AutoSizeText('    ' + '      H' + '    M', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.blue,
                    onTap: ()  => MapsLauncher
                        .launchQuery('Rua Domingos Rubbo, 20, Cristo Redentor, Porto Alegre'),
                  ),
                  SizedBox(height: 10.0),
                  // Hospital Santa Casa
                  new InkWell(
                    child: new Row(
                      children: <Widget>[
                        new FadeInImage.assetNetwork(
                            placeholder: 'assets/hospitais/santa_casa.png',
                            image: '',
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
                            new AutoSizeText('    ' + '      H' + '    M', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.blue,
                    onTap: ()  => MapsLauncher
                        .launchQuery('Rua Domingos Rubbo, 20, Cristo Redentor, Porto Alegre'),
                  ),
                  SizedBox(height: 10.0),
                  // Hospital São Lucas - SUS
                  new InkWell(
                    child: new Row(
                      children: <Widget>[
                        new FadeInImage.assetNetwork(
                            placeholder: 'assets/hospitais/sao_lucas.png',
                            image: '',
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
                            new AutoSizeText('    ' + '      H' + '    M', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.blue,
                    onTap: ()  => MapsLauncher
                        .launchQuery('Rua Domingos Rubbo, 20, Cristo Redentor, Porto Alegre'),
                  ),
                  SizedBox(height: 10.0),
                  // Hospital São Lucas - Pediatria SUS
                  new InkWell(
                    child: new Row(
                      children: <Widget>[
                        new FadeInImage.assetNetwork(
                            placeholder: 'assets/hospitais/sao_lucasp.png',
                            image: '',
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
                            new AutoSizeText('    ' + '      H' + '    M', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.blue,
                    onTap: ()  => MapsLauncher
                        .launchQuery('Rua Domingos Rubbo, 20, Cristo Redentor, Porto Alegre'),
                  ),
                  SizedBox(height: 10.0),
                  // Unidade Pronto Atendimento Bom Jesus
                  new InkWell(
                    child: new Row(
                      children: <Widget>[
                        new FadeInImage.assetNetwork(
                            placeholder: 'assets/hospitais/bomjesus.png',
                            image: '',
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
                            new AutoSizeText('    ' + '      H' + '    M', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.blue,
                    onTap: ()  => MapsLauncher
                        .launchQuery('Rua Domingos Rubbo, 20, Cristo Redentor, Porto Alegre'),
                  ),
                  SizedBox(height: 10.0),
                  // Unidade Pronto Atendimento Bom Jesus Pediatria
                  new InkWell(
                    child: new Row(
                      children: <Widget>[
                        new FadeInImage.assetNetwork(
                            placeholder: 'assets/hospitais/bomjesusp.png',
                            image: '',
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
                            new AutoSizeText('    ' + '      H' + '    M', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.blue,
                    onTap: ()  => MapsLauncher
                        .launchQuery('Rua Domingos Rubbo, 20, Cristo Redentor, Porto Alegre'),
                  ),
                  SizedBox(height: 10.0),
                  // Unidade Pronto Atendimento da Cruzeiro do Sul
                  new InkWell(
                    child: new Row(
                      children: <Widget>[
                        new FadeInImage.assetNetwork(
                            placeholder: 'assets/hospitais/cruzeiro.png',
                            image: '',
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
                            new AutoSizeText('    ' + '      H' + '    M', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.blue,
                    onTap: ()  => MapsLauncher
                        .launchQuery('Rua Domingos Rubbo, 20, Cristo Redentor, Porto Alegre'),
                  ),
                  SizedBox(height: 10.0),
                  // Unidade Pronto Atendimento da Cruzeiro do Sul Pediatria
                  new InkWell(
                    child: new Row(
                      children: <Widget>[
                        new FadeInImage.assetNetwork(
                            placeholder: 'assets/hospitais/cruzeirop.png',
                            image: '',
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
                            new AutoSizeText('    ' + '      H' + '    M', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.blue,
                    onTap: ()  => MapsLauncher
                        .launchQuery('Rua Domingos Rubbo, 20, Cristo Redentor, Porto Alegre'),
                  ),
                  SizedBox(height: 10.0),
                  // Unidade Pronto Atendimento da Lomba do Pinheiro
                  new InkWell(
                    child: new Row(
                      children: <Widget>[
                        new FadeInImage.assetNetwork(
                            placeholder: 'assets/hospitais/lomba.png',
                            image: '',
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
                            new AutoSizeText('    ' + '      H' + '    M', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.blue,
                    onTap: ()  => MapsLauncher
                        .launchQuery('Rua Domingos Rubbo, 20, Cristo Redentor, Porto Alegre'),
                  ),
                  SizedBox(height: 10.0),
                  // Unidade Pronto Atendimento da Lomba do Pinheiro Pediatria
                  new InkWell(
                    child: new Row(
                      children: <Widget>[
                        new FadeInImage.assetNetwork(
                            placeholder: 'assets/hospitais/lombap.png',
                            image: '',
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
                            new AutoSizeText('    ' + '      H' + '    M', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.blue,
                    onTap: ()  => MapsLauncher
                        .launchQuery('Rua Domingos Rubbo, 20, Cristo Redentor, Porto Alegre'),
                  ),
                  SizedBox(height: 10.0),
                  // Unidade Pronto Atendimento Moacyr Scliar
                  new InkWell(
                    child: new Row(
                      children: <Widget>[
                        new FadeInImage.assetNetwork(
                            placeholder: 'assets/hospitais/moacyr.png',
                            image: '',
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
                            new AutoSizeText('    ' + '      H' + '    M', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.blue,
                    onTap: ()  => MapsLauncher
                        .launchQuery('Rua Domingos Rubbo, 20, Cristo Redentor, Porto Alegre'),
                  ),
                  SizedBox(height: 10.0),
                  // Unidade Pronto Atendimento Moacyr Scliar Pediatria
                  new InkWell(
                    child: new Row(
                      children: <Widget>[
                        new FadeInImage.assetNetwork(
                            placeholder: 'assets/hospitais/moacyrp.png',
                            image: '',
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
                            new AutoSizeText('    ' + '      H' + '    M', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.blue,
                    onTap: ()  => MapsLauncher
                        .launchQuery('Rua Domingos Rubbo, 20, Cristo Redentor, Porto Alegre'),
                  ),
                  SizedBox(height: 10.0),
                ]
            ),
          ),
        ),
      ),
    );
  }
}