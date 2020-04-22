import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocemonitorapoa/initial_pages/perfil_com_email_page.dart';
import 'package:vocemonitorapoa/tasks/auth.dart';
import 'package:vocemonitorapoa/tasks/status_login.dart';

class EmailLogin extends StatefulWidget {
  EmailLogin({this.auth});
  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _EmailLoginState();
}
// Enumerador para definir o tipo de formulário
enum FormType{
  login,
  register,
}

class _EmailLoginState extends State<EmailLogin> {

  AuthStatus authStatus = AuthStatus.naoLogado;

  // Chave de definição do formulário
  final formKey = new GlobalKey<FormState>();

  // Variáveis do formulário
  String _email;
  String _password;
  FormType _formType = FormType.login;

  initState() {
    // TODO: implement initState
    jaLogado();
    autoLogIn();
    super.initState();
    }

    // Persistencia de dados
    Future<void> jaLogado() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      if(prefs.get('userEmail') != null){
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => PerfilComEmail(), ),);
      }

    }

  // Validação se os dados de formulário foram preeenchidos
  bool validateAndSave(){
    final form = formKey.currentState;
    form.save();
    if(form.validate()){
      return true;
    }else{
      return false;
    }
  }

  // Recebimento dos dados validados e envio dos mesmos
  void validateAndSubmitLogin() async{
    if(validateAndSave()){
      try{
        // Se for login
        if(_formType == FormType.login) {
          String userId = await widget.auth.signInWithEmailAndPassword(
              _email, _password);
          print("1º if Validade and Submit");
        }else{
          // Se for registro
          String userId = await widget.auth.createUserWithEmailAndPassword(
              _email, _password);
        }
      }catch(e){
        print('Erro ao fazer login $e');
        _showDialog("Erro", "Erro ao fazer login $e");
      }
      if(_email != null){
        print("Logado no Validade and Submit");
        setState(() {
          autoLogIn();
        });
      }else{
        print("Não logado, passou no else do validate and Submit");
      }
    }
  }

// Função de alerta
  void _showDialog(String title, String message) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: new Text(message),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();

              },
            ),
          ],
        );
      },
    );
  }

  // Troca de tela e Reset de dados ao trocar de opção
  void moveToRegister(){
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }
  // Troca de tela e Reset de dados ao trocar de opção
  void moveToLogin(){
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  //Bloco de controle do Login
  TextEditingController nameController = TextEditingController();
  bool isLoggedIn = false;
  String name = '';

    void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String userId = await widget.auth.signInWithEmailAndPassword(
        _email, _password);

      if (userId != null || prefs.get('userEmail') != null) {
      setState(() {
        isLoggedIn = true;
        print('Abriu no if do autoLogIn com ID: '+ userId);
        prefs.setString('userEmail', _email);
        prefs.setString('userId', userId);
        prefs.setString('userName', 'Anônimo');
        print('Email passou como ' + _email);
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => PerfilComEmail(), ),);

      });
      return;
    }
  }

  // Bloco de tela
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // Definições do cabeçalho
        appBar: new AppBar(
          iconTheme: IconThemeData(
            color: Colors.blue[800], //change your color here
          ),
          title: Text('Login com E-mail', style: TextStyle(color: Colors.blue[700] ),),
        ),
        body: new Container(
            padding: EdgeInsets.all(10.0),
            // Formulário
            child: new Form(
              key: formKey,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                // Método modular do formulário entre registro e login
                children: builInputs() + buildSubmitButtons(),
              ),
            )
        )
    );
  }

  // Entrada de dados do formulário
  List<Widget> builInputs(){
    return[
      new TextFormField(
        decoration: new InputDecoration(labelText: 'E-mail',  border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(30.0),
          borderSide: new BorderSide(),),),
        validator: (value) => value.isEmpty ? 'Email não pode ser em branco' : null,
        onSaved: (value) => _email = value,
      ),
      SizedBox(height:14.0),
      new TextFormField(
        obscureText: true,
        decoration: new InputDecoration(labelText: 'Senha', border: new OutlineInputBorder(
    borderRadius: new BorderRadius.circular(30.0),
    borderSide: new BorderSide(),), ),
        validator: (value) => value.isEmpty ? 'Senha não pode ser em branco, minimo 6 caracteres.' : null,
        onSaved: (value) => _password = value,

      ),
    ];
  }
  // If Else para definir os métodos registro ou login
  List<Widget> buildSubmitButtons(){
    if(_formType == FormType.login){
      return[
        SizedBox(height:40.0),
        new RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          color: Colors.blue[700],
          child: new Text('Login', style: new TextStyle(fontSize: 20.0, color: Colors.white),),
          onPressed: validateAndSubmitLogin,

        ),
        SizedBox(height:10.0),
        new FlatButton(onPressed: moveToRegister,
            child: Text('Não tem conta? Crie uma.', style: TextStyle(fontSize: 20.0) ))
      ];
    }else{
      return[
        SizedBox(height:40.0),
        new RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          color: Colors.blue[700],
          child: new Text('Criar conta', style: new TextStyle(fontSize: 20.0, color: Colors.white),),
          onPressed: validateAndSubmitLogin,
        ),
        SizedBox(height:10.0),
        new FlatButton(onPressed: moveToLogin,
            child: Text('Tem uma conta? Faça Login.', style: TextStyle(fontSize: 20.0) ))
      ];

    }

  }
}








