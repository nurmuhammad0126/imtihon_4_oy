import 'package:exam_4/core/extension/context_extensions.dart';
import 'package:exam_4/feature/order/presentation/pages/order_screen_body.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.dark,

      body: OrderScreenBody(),
    );
  }
}
