part of 'auth_bloc.dart';

enum AuthStatus { initial, loading, error, succes }

class AuthState {
  final AuthStatus loginBotton;
  final AuthStatus signUpBotton;
  final AuthStatus forgetPasswordBotton;
  final AuthStatus verificationBotton;

  final bool hideText;
  final bool hideText1;

  final bool rememberBox;

  AuthState({
    required this.loginBotton,
    required this.signUpBotton,
    required this.forgetPasswordBotton,
    required this.verificationBotton,
    this.hideText1 = false,
    this.hideText = false,
    this.rememberBox = false,
  });

  AuthState copyWith({
  AuthStatus? loginBotton,
  AuthStatus? signUpBotton,
  AuthStatus? forgetPasswordBotton,
  AuthStatus? verificationBotton,
  bool? hideText,
  bool? hideText1,
  bool? rememberBox,
}) {
  return AuthState(
    loginBotton: loginBotton ?? this.loginBotton,
    signUpBotton: signUpBotton ?? this.signUpBotton,
    forgetPasswordBotton: forgetPasswordBotton ?? this.forgetPasswordBotton,
    verificationBotton: verificationBotton ?? this.verificationBotton,
    hideText: hideText ?? this.hideText,
    hideText1: hideText1 ?? this.hideText1,
    rememberBox: rememberBox ?? this.rememberBox,
  );
}

}
