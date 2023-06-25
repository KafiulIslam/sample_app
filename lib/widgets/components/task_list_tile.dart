import 'package:flutter/material.dart';
import 'package:sample_app/utils/image_string.dart';
import 'package:sample_app/view/taskPreview/task_preview.dart';
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => isIcon == true
                    ? TaskListScreen(
                        subTitle: subTitle!,
                      )
                    : TaskPreview(taskTitle: taskTitle,)));
      },
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              isIcon == true
                  ? Image.asset(imagePath!)
                  : const SizedBox.shrink(),
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
        ),
      ),
    );
  }
}
