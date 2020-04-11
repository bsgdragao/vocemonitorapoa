import 'package:flutter/material.dart';

class AtendeColunaAdulto extends StatelessWidget {
//  String _title = 'Teste';
//  String _date = 'hoje';
//  String _description = 'teste de formato';
  Image _img;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
     appBar: AppBar(
       title: Text("Hospitais que atendem: \n       Emergência de coluna"),

     ),
      body:  new Container(
        padding: new EdgeInsets.all(14.0),
        child: new Center(
            child: new Column(
              children: <Widget>[
            new Text('Please Login'),
            // Hospital XXX
            new Row(
              children: <Widget>[
                //Hospital Pronto Socorro (HPS)
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
                    new Text(' Hospital Pronto Socorro (HPS)',
                      style: TextStyle(fontSize: 18.0, color: Colors.blue, fontWeight: FontWeight.bold),),
                    new Text('  Largo Teodoro Herzl s/nº \n  Bom Fim, Porto Alegre', style: TextStyle(fontSize: 18.0, color: Colors.blue),),
                    new Text(' Tempo de espera dos usuários: ', style: TextStyle(fontSize: 16.0, color: Colors.blue),),
                    new Text('    ' + '      H' + '    M', style: TextStyle(fontSize: 16.0, color: Colors.blue),),
                  ],
                ),
              ],
          ),
          SizedBox(height: 10.0),
          // Hospital Cristo Redentor (HCR)
            new Row(
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
                        new Text(' Hospital Cristo Redentor (HCR)', style: TextStyle(fontSize: 18.0, color: Colors.blue, fontWeight: FontWeight.bold),),
                        new Text(' Lotação segundo a SMS:', style: TextStyle(fontSize: 18.0, color: Colors.blue),),
                        new Text(' Tempo de espera dos usuários: ', style: TextStyle(fontSize: 16.0, color: Colors.blue),),
                        new Text('    ' + '      H' + '    M', style: TextStyle(fontSize: 16.0, color: Colors.blue),),
                    ],
                ),
              ]
           ),
          ]
          ),
        ),
      ),
    ),
    );
  }
}