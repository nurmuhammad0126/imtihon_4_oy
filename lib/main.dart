import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_4/core/routes/app_routes.dart';
import 'package:exam_4/feature/auth/data/datasource/auth_remote_datasource.dart';
import 'package:exam_4/feature/auth/data/repository/auth_repository.dart';
import 'package:exam_4/feature/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:exam_4/feature/cart/data/datasource/cart_remote_datasource.dart';
import 'package:exam_4/feature/cart/data/repository/cart_repository.dart';
import 'package:exam_4/feature/cart/presentation/blocs/bloc/cart_bloc.dart';
import 'package:exam_4/feature/home/data/datasource/product_remote_datasource.dart';
import 'package:exam_4/feature/home/data/repository/product_repository.dart';
import 'package:exam_4/feature/home/presentation/blocs/bloc/product_bloc.dart';
import 'package:exam_4/feature/order/data/datasource/order_remote_datasource.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/order/presentation/bloc/order_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  static final _fireStore = FirebaseFirestore.instance;
  static final authRemote = AuthRemoteDatasource();
  static final authRepo = AuthRepository(authRemote: authRemote);
  static final productRemoteImpl = ProductRemoteDataSourceImpl(_fireStore);
  static final productRepoImpl = ProductRepositoryImpl(productRemoteImpl);
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc(authRepo: authRepo)),
        BlocProvider(create: (_) => ProductBloc(productRepoImpl)),
        BlocProvider(
          create:
              (_) => CartBloc(
                cartRepositoryImpl: CartRepositoryImpl(
                  remoteDatasource: CartRemoteDatasource(
                    FirebaseFirestore.instance,
                  ),
                ),
              ),
        ),
        BlocProvider(
          create:
              (_) => OrderBloc(
                orderRemoteDatasource: OrderRemoteDatasource(
                  FirebaseFirestore.instance,
                ),
              ),
        ),
      ],
      child: MaterialApp.router(routerConfig: AppRoutes.router),
    );
  }
}
