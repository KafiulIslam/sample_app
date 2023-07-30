import 'package:flutter/material.dart';
import 'package:sample_app/view/taskPreview/task_preview.dart';
import 'package:sample_app/widgets/components/custom_card.dart';
import '../../utils/colors.dart';
import '../../utils/spacer.dart';
import '../../utils/typography.dart';
import '../../view/taskList/task_list_screen.dart';

class TaskListTile extends StatelessWidget {
  final bool? isIcon;
  final String? imagePath;
  final String? taskTitle;
  final String? subTitle;

  const TaskListTile(
      {Key? key,
      this.imagePath,
      this.taskTitle = 'Tasks',
      this.subTitle,
      this.isIcon = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => isIcon == true
                    ? TaskListScreen(
                        subTitle: subTitle!,
                      )
                    : TaskPreview(
                        taskTitle: taskTitle,
                      )));
      },
      row: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          isIcon == true ? Image.asset(imagePath!) : const SizedBox.shrink(),
          twentyFourSpacerHorizontal,
          isIcon == true
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      taskTitle!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: title2,
                    ),
                    Text(
                      subTitle!,
                      style: bodyText2,
                    ),
                  ],
                )
              : Container(
                  width: MediaQuery.of(context).size.width / 1.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        taskTitle!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: title2,
                      ),
                      Text(
                        subTitle!,
                        style: bodyText2,
                      ),
                    ],
                  ),
                ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            color: primaryColor,
            size: 20,
          )
        ],
      ),
    );
  }
}
