import 'package:exam_4/core/extension/context_extensions.dart';
import 'package:flutter/material.dart';
import '../widgets/sing_up_screen_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.dark,

      body: SingUpScreenBody(),
    );
  }
}
