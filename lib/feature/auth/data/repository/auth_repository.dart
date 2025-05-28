import 'package:exam_4/feature/auth/data/datasource/auth_remote_datasource.dart';
import 'package:exam_4/feature/auth/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final AuthRemoteDatasource authRemote;

  AuthRepository({required this.authRemote});

  Future<User?> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final res = await authRemote.loginWithEmail(
        email: email,
        password: password,
      );
      if (res == null) {
        return null;
      }

      return res.user;
    } catch (e) {
      print("ERROR: BOLDI REPO LOGIN: $e");
      return null;
    }
  }

  Future<UserCredential?> registerWithEmail({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = UserModel(name: name, email: email);
      final credential = await authRemote.registerWithEmail(
        email: email,
        password: password,
        userModel: user,
      );

      if (credential != null) {
        await credential.user?.updateDisplayName(name);
        await credential.user?.reload();
      }
      return credential;
    } catch (e) {
      return null;
    }
  }

  Future<bool> resetPassword({required String email}) async {
    try {
      return await authRemote.resetPassword(email);
    } catch (e) {
      throw Exception(e);
    }
  }
}
