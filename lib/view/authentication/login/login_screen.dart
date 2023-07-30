import 'dart:math';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sample_app/utils/colors.dart';
import 'package:sample_app/utils/spacer.dart';
import 'package:sample_app/utils/typography.dart';
import 'package:sample_app/view/authentication/signUp/signup_screen.dart';
import 'package:sample_app/view/home/home_screen.dart';
import 'package:sample_app/widgets/components/buttons/primary_button.dart';
import 'package:sample_app/widgets/components/custom_scaffold.dart';
import 'package:sample_app/widgets/components/input_field/common_text_field.dart';
import 'package:sample_app/widgets/components/input_field/password_input_field.dart';

import '../../../controller/app_constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Client client = Client();
  late Account account;
  final _formKey = GlobalKey<FormBuilderState>();
  late bool isLoading = false;

  Future<void> login(
      String email, String password, BuildContext context) async {
    try {
      var result =
          await account.createEmailSession(email: email, password: password);
      print(result.userId);
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
    } catch (e) {
      print('error is $e');
    }
  }

  @override
  void initState() {
    client.setEndpoint(AppConstant.endPoint).setProject(AppConstant.projectId);
    account = Account(client);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormBuilder(
            key: _formKey,
            enabled: true,
            autovalidateMode: AutovalidateMode.disabled,
            onChanged: () {
              _formKey.currentState!.save();
            },
            child: Column(children: [
              Text(
                'Login',
                style: title1,
              ),
              primaryVerticalSpace,
              const CommonTextField(
                name: 'email',
                title: 'Email',
                hintText: 'Enter your Email',
              ),
              primaryVerticalSpace,
              const PasswordInputField(
                name: 'password',
                title: 'Password',
                hintText: 'Enter the Password',
              ),
              primaryVerticalSpace,
              PrimaryButton(
                buttonTitle: 'Login',
                onTap: () {
                  login(
                      _formKey.currentState?.value['email'],
                      _formKey.currentState?.value['password'],
                      context);
                },
                isLoading: isLoading,
              ),
              primaryVerticalSpace,
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            'If you have not any acocunt please Sign Up first!',
                        style: subtitle1),
                    TextSpan(
                      text: ' Sign Up',
                      style: subtitle1.copyWith(
                          color: primaryColor, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SignUpScreen()));
                        },
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    ));
  }
}
