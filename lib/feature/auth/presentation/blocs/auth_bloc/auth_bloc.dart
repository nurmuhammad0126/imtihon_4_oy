import 'package:exam_4/core/service/user_local_service.dart';
import 'package:exam_4/feature/auth/data/model/user_model.dart';
import 'package:exam_4/feature/auth/data/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepo;
  AuthBloc({required this.authRepo})
    : super(
        AuthState(
          loginBotton: AuthStatus.initial,
          signUpBotton: AuthStatus.initial,
          forgetPasswordBotton: AuthStatus.initial,
          verificationBotton: AuthStatus.initial,
        ),
      ) {
    on<AuthLoginEvent>(_login);

    on<AuthUpdateEvent>(_uptade);

    on<AuthRegisterEvent>(_register);

    on<AuthForgetEvent>(_forgetPassword);
  }

  void _forgetPassword(event, emit) async {
    try {
      emit(state.copyWith(forgetPasswordBotton: AuthStatus.loading));
      final res = await authRepo.resetPassword(email: event.email);
      if (res) {
        emit(state.copyWith(forgetPasswordBotton: AuthStatus.succes));
      }
    } catch (e) {
      emit(state.copyWith(forgetPasswordBotton: AuthStatus.error));
    }
  }

  void _register(event, emit) async {
    emit(state.copyWith(signUpBotton: AuthStatus.loading));
    await Future.delayed(Duration(seconds: 1));

    final credential = await authRepo.registerWithEmail(
      name: event.name,
      email: event.email,
      password: event.password,
    );

    if (credential != null) {
      final user = UserModel(
        name: event.name,
        email: event.email,
        carts: {},
        orders: {},
      );
      _saveUser(user);
      emit(state.copyWith(signUpBotton: AuthStatus.succes));
    } else {
      emit(state.copyWith(signUpBotton: AuthStatus.error));
    }
  }

  void _saveUser(UserModel user) {
    UserLocalService().saveUser(user);
  }

  void _login(event, emit) async {
    emit(state.copyWith(loginBotton: AuthStatus.initial));
    emit(state.copyWith(loginBotton: AuthStatus.loading));

    await Future.delayed(Duration(seconds: 1));
    final res = await authRepo.loginWithEmail(
      email: event.email,
      password: event.password,
    );
    if (res) {
      final user = UserModel(
        name: "",
        email: event.email,
        carts: {},
        orders: {},
      );
      _saveUser(user);
      emit(state.copyWith(loginBotton: AuthStatus.succes));
    } else {
      emit(state.copyWith(loginBotton: AuthStatus.error));
    }
  }

  void _uptade(event, emit) async {
    final AuthState uptade = event.updateAuth;
    emit(
      state.copyWith(
        hideText: uptade.hideText,
        rememberBox: uptade.rememberBox,
      ),
    );
  }
}
