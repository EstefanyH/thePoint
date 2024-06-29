
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:thepointapp/src/network/iNetwork/iSessionService.dart';

class SessionService extends ISessionService with ChangeNotifier  {
  SessionService() : super();
  final _signIn = GoogleSignIn.standard();
  final _auth = FirebaseAuth.instance;

  @override
  Future<UserCredential?> authWithGoogle() async {
    try {
      final _user = await _signIn.signIn();
    
      final _account = await _user?.authentication;
      
      print("Token -> {$_account?.accessToken}");

      final credential = GoogleAuthProvider.credential(
        accessToken: _account?.accessToken,
        idToken: _account?.idToken);
      
      
      return await _auth.signInWithCredential(credential);

    } catch(e) {
      print(e.toString());
      await _signIn.signOut();
    }
    return null;
  }

} 