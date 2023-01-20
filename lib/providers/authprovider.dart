import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String? _token;

  String? get token {
    return _token;
  }

  UserCredential? _credential;
  UserCredential? get credential {
    return _credential;
  }

  User? _user;

  User? get user => _user;

  Future<void> autoLogin() async {
    User? user = _auth.currentUser;
    if (user != null) {
      _token = (await user.getIdToken());
      notifyListeners();
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    User? user = result.user;
    _token = (await user!.getIdToken());
    notifyListeners();
  }

  
  Future<void> signOut() async {
    try {
      _token = null;
      await _auth.signOut();
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
