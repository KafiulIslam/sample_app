import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sample_app/utils/spacer.dart';
import 'package:sample_app/utils/typography.dart';
import 'package:sample_app/view/authentication/login/login_screen.dart';
import 'package:sample_app/widgets/components/buttons/primary_button.dart';
import 'package:sample_app/widgets/components/input_field/common_text_field.dart';
import 'package:sample_app/widgets/components/input_field/password_input_field.dart';
import '../../../controller/app_constant.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  Client client = Client();
  late Account account;
  final _formKey = GlobalKey<FormBuilderState>();
  late bool isLoading = false;

  // login(String email, String password, BuildContext context) async {
  //   try {
  //     var result =
  //     await account.createEmailSession(email: email, password: password);
  //     print(result.userId);
  //     Navigator.pushReplacementNamed(context, AppRoutes.home);
  //
  //   } catch (e) {
  //     print('error is $e');
  //   }
  // }

  Future<void> signUp(
      String email, String password, String name, BuildContext context) async {
    try {
      var result = await account.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: name,
      );

      print("sign up result $result");

      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
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
                'Sign Up',
                style: title1,
              ),
              primaryVerticalSpace,
              const CommonTextField(
                name: 'name',
                title: 'Name',
                hintText: 'Enter your name',
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
                buttonTitle: 'Sign Up',
                onTap: () {
                  signUp(_formKey.currentState?.value['email'],
                       _formKey.currentState?.value['password'],
                      _formKey.currentState?.value['name'],
                       context);
                },
                isLoading: isLoading,
              ),
            ]),
          ),
        ),
      ),
    ));
  }
}
