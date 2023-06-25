import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sample_app/utils/constant.dart';
import 'package:sample_app/utils/typography.dart';
import '../../../utils/colors.dart';

class CommonTextField extends StatelessWidget {
  final String name;
  final String? title;
  final String? hintText;
  final int? maxLines;

  const CommonTextField({
    Key? key,
    required this.name,
    this.title,
    this.hintText = '',
    this.maxLines = 1
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: subtitle1,
        ),
        const SizedBox(
          height: 4.0,
        ),
        FormBuilderTextField(
          name: name,
          autofocus: false,
          maxLines: maxLines,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(16),
            hintText: hintText,
            hintStyle: hintTextStyle,
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