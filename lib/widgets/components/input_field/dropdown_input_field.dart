import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sample_app/utils/constant.dart';
import 'package:sample_app/utils/typography.dart';
import '../../../utils/colors.dart';


class DropdownInputField extends StatelessWidget {
  final String? title;
  final String name;
  final String hintText;
  final List<DropdownMenuItem<String>> itemList;

  const DropdownInputField(
      {Key? key,
        this.title,
        this.hintText = '',
        required this.itemList,
        required this.name,})
      : super(key: key);

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
        FormBuilderDropdown<String>(
          name: name,
           decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(16.0),
            hintText: hintText,
            hintStyle: hintTextStyle,
             focusedBorder: focusedBorder,
             enabledBorder: enableBorder,
             errorBorder: enableBorder,
             focusedErrorBorder: focusedBorder,
            focusColor: primaryColor,
          ),
          items: itemList,
          valueTransformer: (val) => val?.toString(),
        ),
      ],
    );
  }
}