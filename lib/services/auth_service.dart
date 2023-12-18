import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService{
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  
  Future<String?> cadastrarUsuario({
    required String email,
    required String senha,
    required String confirmacaoSenha,
    required String nome,
    }) async {
      try {
        UserCredential userCredential = 
          await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: senha,
        );
        await userCredential.user!.updateDisplayName(nome);

        return null;
      } on FirebaseAuthException catch (e) {
        if (e.code == "email-already-in-use") {
          print(e.code);
          return "O usuario ja esta cadastrado";
        }
        return "Erro desconhecido";
      }
    }
}