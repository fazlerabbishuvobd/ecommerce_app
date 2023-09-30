import 'package:firebase_auth/firebase_auth.dart';

class EmailPasswordAuthentications {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signUpWithEmailPass({required String email, required String password}) async {
    auth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );
  }

  Future<void> signInWithEmailPass({required String email, required String password}) async {
    auth.signInWithEmailAndPassword(
        email: email,
        password: password
    );
  }
}
