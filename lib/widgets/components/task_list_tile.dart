import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/spacer.dart';
import '../../utils/typography.dart';

class TaskListTile extends StatelessWidget {
  final String? imagePath;
  final String? taskNumber;
  const TaskListTile({Key? key, this.imagePath, this.taskNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
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
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(imagePath!),
            twentyFourSpacerHorizontal,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Tasks', style: title2,),
                Text('$taskNumber Tasks', style: bodyText1,),
              ],),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, color: primaryColor, size: 20,)
          ],),
      ),
    );
  }
}
