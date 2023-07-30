import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {

  final VoidCallback? onTap;
  final Widget? row;
  const CustomCard({Key? key, this.onTap, this.row}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: const Color(0xFFF2F2F2)),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFEDF3FF),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF000000).withOpacity(0.05),
              blurRadius: 20.0, // soften the shadow
              offset: const Offset(
                0.0, // Move to right 5  horizontally
                4.0, // Move to bottom 5 Vertically
              ),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: row,
        ),
      ),
    );
  }
}
