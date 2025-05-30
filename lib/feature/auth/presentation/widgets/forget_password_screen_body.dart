import 'package:exam_4/core/extension/context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:exam_4/core/extension/size_extensions.dart';
import 'package:exam_4/core/extension/widget_extensions.dart';
import 'package:exam_4/core/functions/validators.dart';
import 'package:exam_4/core/widgets/w_button.dart';
import 'package:exam_4/core/widgets/w_rounded_container.dart';
import 'package:exam_4/core/widgets/w_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_names.dart';
import '../blocs/auth_bloc/auth_bloc.dart';

class ForgetPasswordScreenBody extends StatefulWidget {
  const ForgetPasswordScreenBody({super.key});

  @override
  State<ForgetPasswordScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<ForgetPasswordScreenBody> {
  final TextEditingController _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: const Text(
            "Tabriklaymiz!",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
          ),
          content: const Text(
            "Tabriklaymiz\nPasswordni tiklash havolasi emailingizga yuborildi 😍.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.orange,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.go(AppNames.login);
              },
              child: const Text(
                "OK",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final authbloc = context.read<AuthBloc>();

    return Stack(
      children: [
        Positioned(
          top: 20.o,
          left: 24.o,
          child: IconButton.filled(
            style: IconButton.styleFrom(backgroundColor: context.colors.white),
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.chevron_left,
              size: 30.o,
              color: context.colors.gray,
            ),
          ).paddingOnly(top: 30),
        ),
        Positioned(
          top: 90.h,

          child: Column(
            children: [
              32.height,
              Text(
                "Forgot Password",
                style: context.styles.s30w700.copyWith(
                  color: context.colors.white,
                ),
              ).paddingSymmetric(horizontal: 62.w),
              12.height,
              Text(
                "Please sign in to your existing account",
                textAlign: TextAlign.center,
                style: context.styles.s16w400.copyWith(
                  color: context.colors.white,
                ),
              ).paddingSymmetric(horizontal: 42.w),
            ],
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: WRoundedContainer(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.o)),
            color: context.colors.white,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "EMAIL",
                    style: context.styles.s12w500,
                  ).paddingOnly(left: 24.0, top: 24.o, bottom: 8.o),

                  Form(
                    key: _formKey,
                    child: WTextField(
                      validator: Validators.validateEmail,
                      controller: _email,
                      contentPadding: EdgeInsets.only(
                        left: 19.o,
                        top: 22.o,
                        bottom: 23.o,
                      ),
                      hasBorderColor: false,
                      border: Border.all(color: context.colors.lightBlue),
                      borderRadius: 10.o,
                      borderColor: context.colors.lightBlue,
                      fillColor: context.colors.lightBlue,
                      hintText: "example@gmail.com",
                      hintTextStyle: context.styles.s14w400.copyWith(
                        color: context.colors.blueGray,
                      ),
                    ).paddingSymmetric(horizontal: 24.o),
                  ),
                  WButton(
                    color: context.colors.orange,
                    borderRadius: 12.o,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        authbloc.add(AuthForgetEvent(email: _email.text));
                      }
                    },
                    padding: EdgeInsets.symmetric(vertical: 17),
                    child: Center(
                      child: BlocConsumer<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if (state.forgetPasswordBotton ==
                              AuthStatus.loading) {
                            return CupertinoActivityIndicator(
                              color: context.colors.white,
                            );
                          }
                          return Text(
                            "SEND CODE",
                            style: context.styles.s14w600.copyWith(
                              color: context.colors.white,
                            ),
                          );
                        },
                        listener: (BuildContext context, AuthState state) {
                          if (state.forgetPasswordBotton == AuthStatus.error) {
                            ScaffoldMessenger.of(context)
                              ..clearSnackBars()
                              ..showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    "EMAIL Xato !!",
                                    style: context.styles.s18w800.copyWith(
                                      color: context.colors.white,
                                    ),
                                  ),
                                ),
                              );
                          } else if (state.forgetPasswordBotton ==
                              AuthStatus.succes) {
                            showSuccessDialog(context);
                          }
                        },
                      ),
                    ),
                  ).paddingSymmetric(horizontal: 24.o, vertical: 30.o),

                  65.height,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
