import 'package:firebase_auth/firebase_auth.dart';

// Clase abstratra para uso do login em outras telas
abstract class BaseAuth{
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password);
  Future<String> currentUser();
}
// Métodos da classe abstrata
class Auth implements BaseAuth{
  // Método de login por e-mail
  Future<String> signInWithEmailAndPassword(String email, String password) async{
    FirebaseUser user = (await FirebaseAuth.instance
        .signInWithEmailAndPassword(
        email: email, password: password)).user;
    print('Logado: ${user.uid}');
    return user.uid;
  }
  // Método de registro por e-mail
  Future<String> createUserWithEmailAndPassword(String email, String password) async {
    FirebaseUser user = (await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)).user;
    print('Criada conta: ${user.uid}');
    return user.uid;
  }
  // Método de Status do usuário (Logado ou não)
  Future<String> currentUser() async {
    FirebaseUser user = (await FirebaseAuth.instance.currentUser());
    return user.uid;
  }

}

