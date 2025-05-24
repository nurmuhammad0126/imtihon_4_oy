import 'package:exam_4/core/extension/context_extensions.dart';
import 'package:exam_4/core/extension/size_extensions.dart';
import 'package:exam_4/core/extension/widget_extensions.dart';
import 'package:exam_4/core/functions/validators.dart';
import 'package:exam_4/core/routes/app_names.dart';
import 'package:exam_4/core/widgets/w_button.dart';
import 'package:exam_4/core/widgets/w_rounded_container.dart';
import 'package:exam_4/core/widgets/w_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/auth_bloc/auth_bloc.dart';

class SingUpScreenBody extends StatefulWidget {
  const SingUpScreenBody({super.key});

  @override
  State<SingUpScreenBody> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SingUpScreenBody> {
  final TextEditingController _name = TextEditingController();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordConfirm = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void signUp() async {
    if (_formKey.currentState!.validate() &&
        _password.text == _passwordConfirm.text) {
      final String name = _name.text;
      final String email = _email.text;
      final String password = _password.text;

      context.read<AuthBloc>().add(
        AuthRegisterEvent(name: name, email: email, password: password),
      );
    } else {
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Malumotlarni To'g'ri Kiritilmadi!!!",
              style: context.styles.s18w600,
            ),
          ),
        );
    }
  }

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
            "Siz muvaffaqiyatli ro'yxatdan o'tdingiz!\nEmail tasdiqlash uchun pochtangizni tekshiring.",
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
          top: 100.o,
          child: Column(
            children: [
              32.height,
              Text(
                "SIGN UP",
                style: context.styles.s30w700.copyWith(
                  color: context.colors.white,
                ),
              ).paddingSymmetric(horizontal: 138.w),
              12.height,
              Text(
                "Please sign up to get started",
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
                    "NAME",
                    style: context.styles.s12w500,
                  ).paddingOnly(left: 24.0, top: 24.o, bottom: 8.o),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WTextField(
                          validator: Validators.validateUsername,
                          controller: _name,
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
                          hintText: "John Doe",
                          hintTextStyle: context.styles.s14w400.copyWith(
                            color: context.colors.blueGray,
                          ),
                        ).paddingSymmetric(horizontal: 24.o),

                        Text(
                          "EMAIL",
                          style: context.styles.s12w500,
                        ).paddingOnly(left: 24.0, top: 24.o, bottom: 8.o),

                        WTextField(
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

                        Text(
                          "Password",
                          style: context.styles.s12w500,
                        ).paddingOnly(left: 24.0, top: 24.o, bottom: 8.o),

                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            return WTextField(
                              isObscureText: state.hideText,
                              controller: _password,
                              contentPadding: EdgeInsets.only(
                                left: 19.o,
                                top: 22.o,
                                bottom: 23.o,
                              ),
                              validator: Validators.validatePassword,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  context.read<AuthBloc>().add(
                                    AuthUpdateEvent(
                                      updateAuth: state.copyWith(
                                        hideText: !state.hideText,
                                      ),
                                    ),
                                  );
                                },
                                icon:
                                    state.hideText
                                        ? Icon(
                                          Icons.visibility,
                                          color: context.colors.blueGray,
                                        )
                                        : Icon(
                                          Icons.visibility_off,
                                          color: context.colors.blueGray,
                                        ),
                              ),
                              hasBorderColor: false,
                              border: Border.all(
                                color: context.colors.lightBlue,
                              ),
                              borderRadius: 10.o,
                              borderColor: context.colors.lightBlue,
                              fillColor: context.colors.lightBlue,
                              hintText: "* * * * * * * * *",
                              hintTextStyle: context.styles.s14w400.copyWith(
                                color: context.colors.blueGray,
                              ),
                            );
                          },
                        ).paddingSymmetric(horizontal: 24.o),
                        24.height,
                        Text(
                          "RE-TYPE PASSWORD",
                          style: context.styles.s12w500,
                        ).paddingOnly(left: 24.0, top: 24.o, bottom: 8.o),

                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            return WTextField(
                              isObscureText: state.hideText1,
                              controller: _passwordConfirm,
                              contentPadding: EdgeInsets.only(
                                left: 19.o,
                                top: 22.o,
                                bottom: 23.o,
                              ),
                              validator: Validators.validatePassword,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  context.read<AuthBloc>().add(
                                    AuthUpdateEvent(
                                      updateAuth: state.copyWith(
                                        hideText: !state.hideText1,
                                      ),
                                    ),
                                  );
                                },
                                icon:
                                    state.hideText1
                                        ? Icon(
                                          Icons.visibility,
                                          color: context.colors.blueGray,
                                        )
                                        : Icon(
                                          Icons.visibility_off,
                                          color: context.colors.blueGray,
                                        ),
                              ),
                              hasBorderColor: false,
                              border: Border.all(
                                color: context.colors.lightBlue,
                              ),
                              borderRadius: 10.o,
                              borderColor: context.colors.lightBlue,
                              fillColor: context.colors.lightBlue,
                              hintText: "* * * * * * * * *",
                              hintTextStyle: context.styles.s14w400.copyWith(
                                color: context.colors.blueGray,
                              ),
                            );
                          },
                        ).paddingSymmetric(horizontal: 24.o),
                      ],
                    ),
                  ),
                  47.height,
                  WButton(
                    color: context.colors.orange,
                    borderRadius: 12.o,
                    onTap: signUp,
                    padding: EdgeInsets.symmetric(vertical: 17),
                    child: Center(
                      child: BlocConsumer<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if (state.signUpBotton == AuthStatus.loading) {
                            return CupertinoActivityIndicator(
                              color: context.colors.white,
                            );
                          }
                          return Text(
                            "SIGN UP",
                            style: context.styles.s14w600.copyWith(
                              color: context.colors.white,
                            ),
                          );
                        },
                        listener: (BuildContext context, AuthState state) {
                          if (state.signUpBotton == AuthStatus.error) {
                            ScaffoldMessenger.of(context)
                              ..clearSnackBars()
                              ..showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    "EMAIL yoki PASSWORD Xoto!!",
                                    style: context.styles.s18w800.copyWith(
                                      color: context.colors.white,
                                    ),
                                  ),
                                ),
                              );
                          }
                          if (state.signUpBotton == AuthStatus.succes) {
                            showSuccessDialog(context);
                          }
                        },
                      ),
                    ),
                  ).paddingSymmetric(horizontal: 24.o, vertical: 5.o),
                  30.height,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
