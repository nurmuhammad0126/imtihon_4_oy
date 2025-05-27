part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  AuthLoginEvent({required this.email, required this.password});
}

class AuthRegisterEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  AuthRegisterEvent({
    required this.name,
    required this.email,
    required this.password,
  });
}

class AuthForgetEvent extends AuthEvent {
  final String email;

  AuthForgetEvent({required this.email});
}

class AuthUpdateEvent extends AuthEvent {
  final AuthState updateAuth;

  AuthUpdateEvent({required this.updateAuth});
}
