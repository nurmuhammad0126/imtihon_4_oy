import 'package:exam_4/core/extension/context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:exam_4/core/extension/size_extensions.dart';
import 'package:exam_4/core/extension/widget_extensions.dart';
import 'package:exam_4/core/functions/validators.dart';
import 'package:exam_4/core/routes/app_names.dart';
import 'package:exam_4/core/widgets/w_button.dart';
import 'package:exam_4/core/widgets/w_rounded_container.dart';
import 'package:exam_4/core/widgets/w_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../blocs/auth_bloc/auth_bloc.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void login() async {
    if (_formKey.currentState!.validate()) {
      final String email = _email.text;
      final String password = _password.text;

      context.read<AuthBloc>().add(
        AuthLoginEvent(email: email, password: password),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            32.height,
            Text(
              "Log In",
              style: context.styles.s30w700.copyWith(
                color: context.colors.white,
              ),
            ).paddingSymmetric(horizontal: 138.w),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return InkWell(
                            onTap: () {
                              context.read<AuthBloc>().add(
                                AuthUpdateEvent(
                                  updateAuth: state.copyWith(
                                    rememberBox: !state.rememberBox,
                                  ),
                                ),
                              );
                            },
                            child:
                                state.rememberBox
                                    ? Icon(Icons.check_box_outlined)
                                    : Icon(
                                      Icons.check_box_outline_blank,
                                      color: context.colors.blueGray,
                                    ),
                          );
                        },
                      ),
                      10.width,
                      Text(
                        "Remember me",
                        style: context.styles.s14w400.copyWith(
                          color: context.colors.blueGray,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          context.push(AppNames.forgetPasword);
                        },
                        child: Text(
                          "Forgot Password",
                          style: context.styles.s14w400.copyWith(
                            color: context.colors.orange,
                          ),
                        ),
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 24.w, vertical: 24.h),

                  WButton(
                    color: context.colors.orange,
                    borderRadius: 12.o,
                    onTap: login,
                    padding: EdgeInsets.symmetric(vertical: 17),
                    child: Center(
                      child: BlocConsumer<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if (state.loginBotton == AuthStatus.loading) {
                            return CupertinoActivityIndicator(
                              color: context.colors.white,
                            );
                          }
                          return Text(
                            "Log In",
                            style: context.styles.s14w600.copyWith(
                              color: context.colors.white,
                            ),
                          );
                        },
                        listener: (BuildContext context, AuthState state) {
                          if (state.loginBotton == AuthStatus.error) {
                            ScaffoldMessenger.of(context)
                              ..clearSnackBars()
                              ..showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    "Email yoki Password Xoto !!!\nYoki EMIAL tasdiqlanmagan !!!",
                                    style: context.styles.s18w800.copyWith(
                                      color: context.colors.white,
                                    ),
                                  ),
                                ),
                              );
                          }
                          if (state.loginBotton == AuthStatus.succes) {
                            context.go(AppNames.home);
                          }
                        },
                      ),
                    ),
                  ).paddingSymmetric(horizontal: 24.o, vertical: 5.o),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account?",
                        style: context.styles.s16w400.copyWith(
                          color: context.colors.darkGray,
                        ),
                      ),
                      10.width,
                      InkWell(
                        onTap: () {
                          context.push(AppNames.signUp);
                        },
                        child: Text(
                          "Sign Up",
                          style: context.styles.s14w700.copyWith(
                            color: context.colors.orange,
                          ),
                        ),
                      ),
                    ],
                  ).paddingSymmetric(vertical: 24.h),

                  Divider(color: context.colors.lightBlue),
                  16.height,
                  Center(
                    child: Text(
                      "Or",
                      style: context.styles.s18w400.copyWith(
                        color: context.colors.blueGray,
                      ),
                    ),
                  ),
                  15.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 31.o,
                        backgroundColor: Color(0xFF395998),
                        child: SvgPicture.asset(context.icons.facebook),
                      ),
                      CircleAvatar(
                        radius: 31.o,
                        backgroundColor: Color(0xFF169CE8),
                        child: SvgPicture.asset(context.icons.twitter),
                      ),
                      CircleAvatar(
                        radius: 31.o,
                        backgroundColor: Color(0xFF1B1F2F),
                        child: SvgPicture.asset(context.icons.apple),
                      ),
                    ],
                  ),
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
