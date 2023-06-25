import 'package:flutter/material.dart';
import 'package:sample_app/utils/colors.dart';
import '../../utils/image_string.dart';
import '../../utils/spacer.dart';
import '../../utils/typography.dart';
import '../../widgets/components/task_list_tile.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<TaskListTile> _itemsList = const [
      TaskListTile(
        taskTitle: 'Lorem ipsum dolor sit',
        taskNumber: '6',
      ),
      TaskListTile(
        taskTitle: 'Erspiciatis unde omnis',
        taskNumber: 'Today',
      ),
      TaskListTile(
        taskTitle: 'Consequuntur magni',
        taskNumber: '3 days',
      ),
      TaskListTile(
        taskTitle: 'Voluptatem sequi nesc',
        taskNumber: 'Week',
      ),
      TaskListTile(
        taskTitle: 'Neque porro quisqua',
        taskNumber: 'Fortnight',
      ),
      TaskListTile(
        taskTitle: 'Lorem ipsum dolor sit',
        taskNumber: 'Month',
      ),
      TaskListTile(
        taskTitle: 'Erspiciatis unde omnis',
        taskNumber: 'Year',
      ),
      TaskListTile(
        taskTitle: 'Consequuntur magni',
        taskNumber: 'Yesterday',
      ),
    ];

    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tasks',
                        style: title1,
                      ),
                      Text(
                        '6 Tasks',
                        style: bodyText1,
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_circle,
                        color: primaryColor,
                        size: 36,
                      ))
                ],
              ),
              thirtyTwoSpacerVertical,
              ListView.separated(
                shrinkWrap: true,
                itemCount: _itemsList.length,
                separatorBuilder: (BuildContext context, int index) =>
                    primaryVerticalSpace,
                itemBuilder: (BuildContext context, int index) {
                  return _itemsList[index];
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}
