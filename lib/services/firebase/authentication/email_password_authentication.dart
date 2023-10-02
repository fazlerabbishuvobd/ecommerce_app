import 'package:firebase_auth/firebase_auth.dart';

class EmailPasswordAuthentications {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserCredential> signUpWithEmailPass({required String email, required String password}) async {
    final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );
    return credential;
  }

  Future<UserCredential> signInWithEmailPass({required String email, required String password}) async {
    final credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password
    );
    return credential;
  }
}
