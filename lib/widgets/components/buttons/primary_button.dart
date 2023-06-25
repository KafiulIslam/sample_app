import 'package:flutter/material.dart';
import 'package:sample_app/utils/colors.dart';
import '../../../utils/typography.dart';

class PrimaryButton extends StatelessWidget {
  final String? buttonTitle;
  final VoidCallback? onTap;
  const PrimaryButton({Key? key, this.buttonTitle, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Text(
          buttonTitle!,
          style: buttonTitleStyle,
        ),
      ),
    );
  }
}
