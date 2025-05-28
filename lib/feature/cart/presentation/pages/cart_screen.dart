import 'package:exam_4/core/extension/context_extensions.dart';
import 'package:exam_4/feature/cart/presentation/widgets/cart_screen_app_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/cart_screen_body.dart';
import '../widgets/cart_screen_bottom_navigation.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.dark,
      appBar: CartScreenAppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1));
          setState(() {});
        },
        child: CartScreenBody(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showCartBottomSheet(context),
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

void showCartBottomSheet(BuildContext context) {
  final TextEditingController controller = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      return SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: CartScreenBottomNavigation(controller: controller),
        ),
      );
    },
  ).whenComplete(() {
    controller.dispose();
  });
}
