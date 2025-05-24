import 'package:exam_4/core/extension/context_extensions.dart';
import 'package:flutter/material.dart';

import '../widgets/forget_password_screen_body.dart';

class ForgetPaswordScreen extends StatelessWidget {
  const ForgetPaswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.dark,

      body: ForgetPasswordScreenBody(),
    );
  }
}
