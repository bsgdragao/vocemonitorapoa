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
    super.initState();
    autoLogIn();
      widget.auth.currentUser().then((userId) {
        setState(() {
          authStatus =
          userId == null ? AuthStatus.naoLogado : AuthStatus.logado;
        });
      });
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

  //Bloco de persistência do Login
  TextEditingController nameController = TextEditingController();

  bool isLoggedIn = false;
  String name = '';

  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userId = await widget.auth.signInWithEmailAndPassword(
        _email, _password);

    if (userId != null) {
      setState(() {
        isLoggedIn = true;
        name = userId;
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => PerfilComEmail(email: _email,), ),);
      });
      return;
    }
  }

  Future<Null> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', null);

    setState(() {
      name = '';
      isLoggedIn = false;
    });
  }

  Future<Null> loginUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', nameController.text);

    setState(() {
      name = nameController.text;
      isLoggedIn = true;
    });

    nameController.clear();
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
            padding: EdgeInsets.all(16.0),
            // Formulário
            child: new Form(
              key: formKey,
              child: new Column(
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
        decoration: new InputDecoration(labelText: 'E-mail'),
        validator: (value) => value.isEmpty ? 'Email não pode ser em branco' : null,
        onSaved: (value) => _email = value,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Senha' ),
        obscureText: true,
        validator: (value) => value.isEmpty ? 'Senha não pode ser em branco, minimo 6 caracteres.' : null,
        onSaved: (value) => _password = value,
      ),
    ];
  }
  // If Else para definir os métodos registro ou login
  List<Widget> buildSubmitButtons(){
    if(_formType == FormType.login){
      return[
        new RaisedButton(
          child: new Text('Login', style: new TextStyle(fontSize: 20.0),),
          onPressed: validateAndSubmitLogin,

        ),
        new FlatButton(onPressed: moveToRegister,
            child: Text('Não tem conta? Crie uma.', style: TextStyle(fontSize: 20.0) ))
      ];
    }else{
      return[
        new RaisedButton(
          child: new Text('Criar conta', style: new TextStyle(fontSize: 20.0),),
          onPressed: validateAndSubmitLogin,
        ),
        new FlatButton(onPressed: moveToLogin,
            child: Text('Tem uma conta? Faça Login.', style: TextStyle(fontSize: 20.0) ))
      ];

    }

  }
}





