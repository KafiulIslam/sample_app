import 'package:flutter/material.dart';
import 'package:sample_app/utils/colors.dart';
import 'package:sample_app/view/newTask/new_task_screen.dart';
import 'package:sample_app/widgets/components/custom_scaffold.dart';
import '../../utils/spacer.dart';
import '../../utils/typography.dart';
import '../../widgets/components/task_list_tile.dart';

class TaskListScreen extends StatelessWidget {
  final String subTitle;
  const TaskListScreen({Key? key, required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TaskListTile> _itemsList = const [
      TaskListTile(
        taskTitle: 'Lorem ipsum dolor sit',
        subTitle: 'Today',
      ),
      TaskListTile(
        taskTitle: 'Erspiciatis unde omnis',
        subTitle: 'Today',
      ),
      TaskListTile(
        taskTitle: 'Consequuntur magni',
        subTitle: '3 days',
      ),
      TaskListTile(
        taskTitle: 'Voluptatem sequi nesc',
        subTitle: 'Week',
      ),
      TaskListTile(
        taskTitle: 'Neque porro quisqua',
        subTitle: 'Fortnight',
      ),
      TaskListTile(
        taskTitle: 'Lorem ipsum dolor sit',
        subTitle: 'Month',
      ),
      TaskListTile(
        taskTitle: 'Erspiciatis unde omnis',
        subTitle: 'Year',
      ),
      TaskListTile(
        taskTitle: 'Consequuntur magni',
        subTitle: 'Yesterday',
      ),
    ];

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tasks',
                style: title1,
              ),
              Text(
                subTitle,
                style: bodyText1,
              ),
            ],
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const NewTaskScreen()));
              },
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
    ]);
  }
}
