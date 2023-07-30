import 'package:flutter/material.dart';
import 'package:sample_app/utils/image_string.dart';
import 'package:sample_app/utils/spacer.dart';
import 'package:sample_app/view/journal/widgets/journal_tile.dart';
import 'package:sample_app/widgets/components/custom_scaffold.dart';
import '../../utils/typography.dart';
import '../../widgets/components/task_list_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<TaskListTile> _tasksList = const [
      TaskListTile(
        isIcon: true,
        imagePath: laptop,
        subTitle: '6 Tasks',
      ),
    ];

    return CustomScaffold(children: [
      Text(
        'Sample App',
        style: title1,
      ),
      thirtyTwoSpacerVertical,
      TaskListTile(
        isIcon: true,
        imagePath: laptop,
        subTitle: '6 Tasks',
      ),
      primaryVerticalSpace,
      JournalTile(
        imagePath: laptop,
        taskTitle: 'Journal',
        subTitle: '4 Items',
      ),

      // ListView.separated(
      //   shrinkWrap: true,
      //   itemCount: _tasksList.length,
      //   separatorBuilder: (BuildContext context, int index) =>
      //       primaryVerticalSpace,
      //   itemBuilder: (BuildContext context, int index) {
      //     return _tasksList[index];
      //   },
      // )
    ]);
  }
}
