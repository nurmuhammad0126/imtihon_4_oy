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
      emit(state.copyWith(signUpBotton: AuthStatus.succes));
    } else {
      emit(state.copyWith(signUpBotton: AuthStatus.error));
    }
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
