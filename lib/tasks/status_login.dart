import 'package:flutter/material.dart';
import 'package:vocemonitorapoa/initial_pages/login_com_email_page.dart';
import 'auth.dart';

// Bloco de autenticação por Email
class StatusLogin extends StatefulWidget {
  StatusLogin({this.auth});
  final BaseAuth auth;
  @override
  State<StatefulWidget> createState() => new _StatusLoginState();
}

enum AuthStatus{
  logado,
  naoLogado,
}

class _StatusLoginState extends State<StatusLogin> {

  AuthStatus authStatus = AuthStatus.naoLogado;

  String _email;
  String _password;

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    widget.auth.currentUser().then((userId){
      setState(() {
        authStatus = userId == null ? AuthStatus.naoLogado : AuthStatus.logado;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    switch(authStatus) {
      case AuthStatus.naoLogado:
        return new EmailLogin(auth: widget.auth,);
      case AuthStatus.logado:
        final Future<String> userId = widget.auth.signInWithEmailAndPassword(
            _email, _password);
        //return new PerfilComEmail();
    }
  }
}