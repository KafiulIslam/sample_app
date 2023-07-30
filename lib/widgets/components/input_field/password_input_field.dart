import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sample_app/utils/typography.dart';
import '../../../utils/colors.dart';
import '../../../utils/constant.dart';


class PasswordInputField extends StatefulWidget {
  final String name;
  final String? title;
  final String? hintText;

  const PasswordInputField(
      {Key? key, required this.name, this.title,  this.hintText})
      : super(key: key);

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {

  late bool _isPassObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title!,
          style: subtitle1,
        ),
        const SizedBox(
          height: 12,
        ),
        FormBuilderTextField(
          name: widget.name ,
          obscureText: _isPassObscure,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(16),
            hintText: widget.hintText,
            hintStyle: hintTextStyle,
            prefixIcon: const Icon(Icons.lock, color:  assTextColor,),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _isPassObscure = !_isPassObscure;
                  var index = 0;
                  if (!_isPassObscure) {
                    index = 1;
                  }
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                    child: _isPassObscure
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility) ),
              ),
            ),
            focusedBorder: focusedBorder,
            enabledBorder: enableBorder,
            errorBorder: enableBorder,
            focusedErrorBorder: focusedBorder,
            focusColor: primaryColor,
          ),
        ),
      ],
    );
  }
}
