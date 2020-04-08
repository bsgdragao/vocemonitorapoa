import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vocemonitorapoa/sintomas_pages/coluna.dart';
import 'package:vocemonitorapoa/sintomas_pages/dordebarriga.dart';
import 'package:vocemonitorapoa/sintomas_pages/febre.dart';
import 'package:vocemonitorapoa/sintomas_pages/manchas.dart';
import 'package:vocemonitorapoa/sintomas_pages/objetosnocorpo.dart';
import 'package:vocemonitorapoa/sintomas_pages/olho.dart';
import 'package:vocemonitorapoa/sintomas_pages/pancada.dart';
import 'package:vocemonitorapoa/sintomas_pages/sangramento.dart';
import 'package:vocemonitorapoa/sintomas_pages/tontura.dart';
import 'package:vocemonitorapoa/sintomas_pages/tosse.dart';
import 'package:vocemonitorapoa/sintomas_pages/coracao.dart';
import 'package:vocemonitorapoa/sintomas_pages/vomito.dart';
import '../icons/my_flutter_app_icons.dart';
import 'ossoquebrado.dart';



class TriagemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = "Selecione o principal sintomas:";
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        home: Scaffold(appBar: AppBar(
          title: Text(title),
        ),
            body: GridView.count(
                crossAxisCount: 2,
                children: List.generate(opcoes.length, (index) {
                  return Center(
                    child: OpcaoCard(opcao: opcoes[index]),
                  );
                }
                )
            )
        )
    );
  }
}
class Opcao {
  const Opcao({this.linkAction, this.titulo, this.icon});
  final String linkAction;
  final String titulo;
  final IconData icon;
 }

  const List<Opcao> opcoes = const <Opcao>[
  const Opcao(linkAction: 'Ambulancia', titulo: 'Ambulância', icon: FontAwesomeIcons.ambulance),
  const Opcao(linkAction: 'Coluna', titulo: 'Coluna', icon: MyFlutterApp.coluna),
  const Opcao(linkAction: 'Coracao', titulo: 'Coração', icon: MyFlutterApp.coracao),
  const Opcao(linkAction: 'Tosse', titulo: 'Tosse e Corisa', icon: MyFlutterApp.corisa),
  const Opcao(linkAction: 'DorDeBarriga', titulo: 'Dor de Barriga', icon: MyFlutterApp.dordebarriga),
  const Opcao(linkAction: 'Febre', titulo: 'Febre', icon: MyFlutterApp.febre2),
  const Opcao(linkAction: 'Manchas', titulo: 'Manchas', icon: MyFlutterApp.manchas),
  const Opcao(linkAction: 'Olho', titulo: 'Olho', icon: MyFlutterApp.olho),
  const Opcao(linkAction: 'OssoQuebrado', titulo: 'Osso Quebrado', icon: MyFlutterApp.ossosquebrados),
  const Opcao(linkAction: 'Pancada', titulo: 'Pancada na Cabeça', icon: MyFlutterApp.pancadanacabeca),
  const Opcao(linkAction: 'Sangramento', titulo: 'Sangramento', icon: MyFlutterApp.sangramento),
  const Opcao(linkAction: 'Tontura', titulo: 'Tontura', icon: MyFlutterApp.tontura),
  const Opcao(linkAction: 'Vomito', titulo: 'Vômito', icon: MyFlutterApp.vomito),
  const Opcao(linkAction: 'Objetos', titulo: 'Objetos no Corpo', icon: MyFlutterApp.sangramento2),

];


class OpcaoCard extends StatelessWidget {
  const OpcaoCard({Key key, this.opcao}) : super(key: key);
  final Opcao opcao;
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context)
        .textTheme.headline4;
//    final linkAction = ["Ambulancia", "coluna", "coracao", "tosse", "dordebarriga", "febre",
//      "manchas", "olho", "ossoquebrado", "pacadanacabeca", "sangramento",
//      "tontura", "vomito", "objetosnocorpo"];

   openPage(String linkOpt){
     switch(linkOpt){
       // Ligação para Samu
       case 'Ambulancia':
         launch("tel://192");
            print('Selecionou Ambulancia');
       break;
       // Página para problemas na coluna
       case 'Coluna':
         Navigator.push(
           context,
           new MaterialPageRoute(
             builder: (context) => new ColunaPage(),
           ),
         );
            print('Selecionou coluna');
       break;
     // Página para problemas no coração
       case 'Coracao':
         Navigator.push(
           context,
           new MaterialPageRoute(
             builder: (context) => new CoracaoPage(),
           ),
         );
            print('Selecionou coracao');
       break;
     // Página para problemas no estômago
       case 'DorDeBarriga':
         Navigator.push(
           context,
           new MaterialPageRoute(
             builder: (context) => new DorDeBarrigaPage(),
           ),
         );
            print('Selecionou dor de barriga');
       break;
     // Página para problemas na Febre
       case 'Febre':
         Navigator.push(
           context,
           new MaterialPageRoute(
             builder: (context) => new FebrePage(),
           ),
         );
         print('Selecionou febre');
       break;
     // Página para problemas com manchas no corpo
       case 'Manchas':
         Navigator.push(
           context,
           new MaterialPageRoute(
             builder: (context) => new ManchasPage(),
           ),
         );
         print('Selecionou manchas');
       break;
     // Página para problemas com objetos no corpo
       case 'Objetos':
         Navigator.push(
           context,
           new MaterialPageRoute(
             builder: (context) => new ObjetosNoCorpoPage(),
           ),
         );
         print('Selecionou Objetos');
       break;
       // Página para problemas no olho
       case 'Olho':
       Navigator.push(
         context,
         new MaterialPageRoute(
           builder: (context) => new OlhoPage(),
         ),
       );
          print('Selecionou olho');
       break;
     // Página para problemas com ossos quebrados
       case 'OssoQuebrado':
         Navigator.push(
           context,
           new MaterialPageRoute(
             builder: (context) => new OssoQuebradoPage(),
           ),
         );
           print('Selecionou Osso quebrado');
       break;
     // Página para problemas com pancadas
       case 'Pancada':
         Navigator.push(
           context,
           new MaterialPageRoute(
             builder: (context) => new PancadaPage(),
           ),
         );
         print('Selecionou pancada');
       break;

       case 'Sangramento':
         Navigator.push(
           context,
           new MaterialPageRoute(
             builder: (context) => new SangramentoPage(),
           ),
         );
         print('Selecionou sangramento');
       break;

       case 'Tosse':
         Navigator.push(
           context,
           new MaterialPageRoute(
             builder: (context) => new TossePage(),
           ),
         );
         print('Selecionou tosse');
       break;

       case 'Tontura':
         Navigator.push(
           context,
           new MaterialPageRoute(
             builder: (context) => new TonturaPage(),
           ),
         );
         print('Selecionou tontura');
       break;

       case 'Vomito':
         Navigator.push(
           context,
           new MaterialPageRoute(
             builder: (context) => new VomitoPage(),
           ),
         );
         print('Selecionou vomito');
       break;

     }
   }

    return Card(
        color: Colors.white,
        child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          openPage(opcao.linkAction);
          print('Card tapped.');
        },
        child: Center(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(opcao.icon, size:80.0, color: textStyle.color),
                Text(opcao.titulo, style: textStyle),

              ]
          ),
        )
      )
    );
  }
}