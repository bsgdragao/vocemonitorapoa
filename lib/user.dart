
import 'package:shared_preferences/shared_preferences.dart';

class UserLogged{
  static final usuarioId = 'id';
  static final usuarioNome = 'nome';
  static final usuarioEmail = 'email';

 saveUser(usuarioId, usuarioNome, usuarioEmail ) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('usuarioId', usuarioId);
  await prefs.setString('usuarioNome', usuarioNome);
  await prefs.setString('usuarioEmail', usuarioEmail);


}
}