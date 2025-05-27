import 'package:exam_4/core/extension/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc/product_bloc.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<ProductBloc>().add(LoadProducts("fast_food"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.white,
      appBar: HomeAppBar(),
      body: HomeScreenBody(),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     final p = ProductModel(
      //       id: "",
      //       name: "SALADS",
      //       image:
      //           "https://cdn.loveandlemons.com/wp-content/uploads/2024/01/winter-salad.jpg",
      //       price: 40,
      //       rating: 5,
      //       title: "pizza calzone european",
      //       categoryId: "salads",
      //     );
      //     await ProductRemoteDataSourceImpl(
      //       FirebaseFirestore.instance,
      //     ).addProduct(p);
      //   },
      // ),
    );
  }
}
