import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthRemoteDatasource {
  final _firebase = FirebaseAuth.instance;

   Future<UserCredential?> registerWithEmail(String email, String password) async {
    try {
      UserCredential credential = await _firebase.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user?.sendEmailVerification();
      debugPrint("Ro'yxatdan o'tdi. Email tasdiqlash yuborildi.");
      return credential;
    } on FirebaseAuthException catch (e) {
      debugPrint("Xatolik (register): ${e.code} - ${e.message}");
      return null;
    } catch (e) {
      debugPrint("Xatolik (register): $e");
      return null;
    }
  }

  Future<UserCredential?> loginWithEmail(String email, String password) async {
    try {
      UserCredential credential = await _firebase.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!credential.user!.emailVerified) {
        debugPrint("Email tasdiqlanmagan.");
        await _firebase.signOut();
        return null;
      }

      debugPrint("Kirildi.");
      return credential;
    } on FirebaseAuthException catch (e) {
      debugPrint("Xatolik (login): ${e.code} - ${e.message}");
      return null;
    } catch (e) {
      debugPrint(" Xatolik (login): $e");
      return null;
    }
  }

   Future<bool> resetPassword(String email) async {
    try {
      await _firebase.sendPasswordResetEmail(email: email);
      debugPrint("Parol tiklash havolasi yuborildi.");
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint("Xatolik (resetPassword): ${e.code} - ${e.message}");
      return false;
    } catch (e) {
      debugPrint("Xatolik (resetPassword): $e");
      return false;
    }
  }
}
