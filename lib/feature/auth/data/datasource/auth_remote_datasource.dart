import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../model/user_model.dart';

class AuthRemoteDatasource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AuthRemoteDatasource() {
    _firebaseAuth.idTokenChanges().listen((User? user) async {
      if (user != null) {
        String token = await user.getIdToken(true) ?? "";
        debugPrint("Token yangilandi: $token");
      } else {
        debugPrint("Foydalanuvchi chiqib ketdi yoki yo'q");
      }
    });
  }

  Future<UserCredential?> registerWithEmail({
    required String email,
    required String password,
    required UserModel userModel,
  }) async {
    try {
      UserCredential credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      await credential.user?.sendEmailVerification();
      debugPrint("Ro'yxatdan o'tdi. Email tasdiqlash yuborildi.");

      await addUser(userModel.copyWith(id: credential.user!.uid));

      return credential;
    } on FirebaseAuthException catch (e) {
      debugPrint("Xatolik (register): ${e.code} - ${e.message}");
      return null;
    } catch (e) {
      debugPrint("Xatolik (register): $e");
      return null;
    }
  }

  Future<UserCredential?> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      if (!credential.user!.emailVerified) {
        debugPrint("Email tasdiqlanmagan.");
        await _firebaseAuth.signOut();
        return null;
      }

      debugPrint("Kirildi.");
      return credential;
    } on FirebaseAuthException catch (e) {
      debugPrint("Xatolik (login): ${e.code} - ${e.message}");
      return null;
    } catch (e) {
      debugPrint("Xatolik (login): $e");
      return null;
    }
  }

  Future<bool> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
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

  Future<void> addUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.id).set(user.toJson());
      debugPrint("Foydalanuvchi Firestore'ga qo'shildi.");
    } catch (e) {
      debugPrint("Xatolik (addUser): $e");
    }
  }

  User? get currentUser => _firebaseAuth.currentUser;

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  bool get isLoggedIn => _firebaseAuth.currentUser != null;

  String? getUserId() {
    return _firebaseAuth.currentUser?.uid;
  }

  Future<String?> getToken({bool forceRefresh = false}) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      return await user.getIdToken(forceRefresh);
    }
    return null;
  }
}
