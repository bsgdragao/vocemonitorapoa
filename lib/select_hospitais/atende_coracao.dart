import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:maps_launcher/maps_launcher.dart';


class AtendeCoracao extends StatelessWidget {

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
                ]
            ),
          ),
        ),
      ),
    );
  }
}