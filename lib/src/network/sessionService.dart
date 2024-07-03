
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:thepointapp/src/network/iNetwork/iSessionService.dart';

class SessionService extends ISessionService with ChangeNotifier  {
  SessionService() : super();
/*
  final auth = FirebaseAuth.instance;
  final signIn = GoogleSignIn();

  @override
  Future<UserCredential?> authWithGoogle() async {
    try {
      final user = await signIn.signIn();
    
      final account = await user?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: account?.accessToken,
        idToken: account?.idToken);
      
      var data = await auth.signInWithCredential(credential) ;

      print(data.user?.displayName);

      return data;

    } on FirebaseAuthException catch(e) {
      print('ws authWithGoogle Error -> $e.toString()');
      await signIn.signOut();
    }
    return null;
  }
*/
} 