import 'package:exam_4/core/routes/app_routes.dart';
import 'package:exam_4/feature/auth/data/datasource/auth_remote_datasource.dart';
import 'package:exam_4/feature/auth/data/repository/auth_repository.dart';
import 'package:exam_4/feature/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (_) => AuthBloc(
                authRepo: AuthRepository(authRemote: AuthRemoteDatasource()),
              ),
        ),
      ],
      child: MaterialApp.router(routerConfig: AppRoutes.router),
    );
  }
}
