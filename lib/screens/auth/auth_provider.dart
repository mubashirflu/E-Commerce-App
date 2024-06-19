import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;
  Future<User?> createUserwithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } on FirebaseAuthException catch (e) {
      exceptionHandler(e.code);
    } catch (e) {
      print("Something went wrong");
    }
    return null;
  }

  Future<User?> loginwithUserEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } on FirebaseAuthException catch (e) {
      exceptionHandler(e.code);
    } catch (e) {
      print("Something went wrong");
    }
    return null;
  }

  Future<void> Signout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("Something wrong");
    }
  }
}

exceptionHandler(String code) {
  switch (code) {
    case "Invalid Crendatial":
      print("Your login credential are invalid");
    case "weak password":
      print("Your Password must be at least 8 character");
    case "Email already in use":
      print("User Already Exists");
    default:
      print("Something went wrong");
  }
}
