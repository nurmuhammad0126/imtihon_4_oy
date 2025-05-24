import 'package:exam_4/feature/auth/data/datasource/auth_remote_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final AuthRemoteDatasource authRemote;

  AuthRepository({required this.authRemote});

  Future<bool> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final res = await authRemote.loginWithEmail(email, password);
      return res != null;
    } catch (e) {
      print("ERROR: BOLDI REPO LOGIN: $e");
      return false;
    }
  }

  Future<UserCredential?> registerWithEmail({
  required String name,
  required String email,
  required String password,
}) async {
  try {
    final credential = await authRemote.registerWithEmail(email, password);

    if (credential != null) {
      await credential.user?.updateDisplayName(name);
      await credential.user?.reload();
    }
    return credential;
  } catch (e) {
    return null;
  }
}

}
