import 'package:exam_4/core/extension/context_extensions.dart';
import 'package:exam_4/feature/home/data/model/product_model.dart';
import 'package:exam_4/feature/home/presentation/blocs/cubit/product_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../widgets/product_app_bar.dart';
import '../widgets/product_body.dart';
import '../widgets/product_bottom_bar.dart';

class HomeProductDetailScreen extends StatefulWidget {
  const HomeProductDetailScreen({super.key});

  @override
  State<HomeProductDetailScreen> createState() =>
      _HomeProductDetailScreenState();
}

class _HomeProductDetailScreenState extends State<HomeProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final product = GoRouterState.of(context).extra as ProductModel;

    return BlocProvider(
      create: (context) => ProductDetailCubit(),
      child: Scaffold(
        backgroundColor: context.colors.white,

        appBar: ProductAppBar(),
        body: ProductBody(product: product),
        bottomNavigationBar: ProductBottomBar(id: product.id,),
      ),
    );
  }
}
