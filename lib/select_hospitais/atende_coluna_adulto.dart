import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:maps_launcher/maps_launcher.dart';


class AtendeColunaAdulto extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Selecione um hospital: "),
        ),
        body:  new Container(
          padding: new EdgeInsets.all(14.0),
          child: new Center(
            child: new ListView(
      //          shrinkWrap: true,
                children: <Widget>[
                  AutoSizeText('Clique em um hospital para ver como chegar...',
                    style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.w900),minFontSize: 18.0,),
                  SizedBox(height: 20.0),
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
                        .launchQuery('Largo Teodoro Herzl s/nº, Bom Fim, Porto Alegre'),

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