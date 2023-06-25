import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sample_app/widgets/components/custom_scaffold.dart';
import '../../utils/colors.dart';
import '../../utils/spacer.dart';
import '../../utils/typography.dart';

class TaskPreview extends StatelessWidget {

  final String? taskTitle;
  const TaskPreview({Key? key, this.taskTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(children: [
      IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
            size: 32,
          )),
      eightVerticalSpace,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Task Preview',
            style: title1,
          ),
          SvgPicture.asset('assets/svgs/delete_icon.svg'),

        ],
      ),
      thirtyTwoSpacerVertical,
      _taskInfoTile('Task', taskTitle!),
      _divider(),
      _taskInfoTile('Type', 'Personal Project'),
      _divider(),
      _taskInfoTile('Priority', 'Nice to have'),
      _divider(),
      _taskInfoTile('Timeframe', 'Week'),
      _divider(),
      _taskInfoTile('Description', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod'),
    ]);
  }

 Column _taskInfoTile(String title, info) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text( title,style: bodyText1,),
        Text( info,style: title2.copyWith(color: const Color(0xFF2A2A2A)),),
      ],
    );
 }

 Padding _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 24.0),
      child: Divider(height: 2, color: borderColor,),
    );
  }

}
