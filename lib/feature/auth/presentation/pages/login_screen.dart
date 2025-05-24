import 'package:exam_4/core/extension/context_extensions.dart';
import 'package:flutter/material.dart';

import '../widgets/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.dark,
      appBar: AppBar(backgroundColor: context.colors.dark),
      body: LoginScreenBody(),
    );
  }
}
