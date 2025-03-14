import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth_Service {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googlesignin = GoogleSignIn();

  Future<User?> googlesignin() async {
    try {
      final GoogleSignInAccount? googleuser = await _googlesignin.signIn();
      if (googleuser == null) return null;
      final GoogleSignInAuthentication authentication =
          await googleuser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: authentication.accessToken,
        idToken: authentication.idToken,
      );
      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      return userCredential.user;
    } on Exception catch (e) {
      debugPrint("Error during Google Sign-In: $e");
    }
  }
}
