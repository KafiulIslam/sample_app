import 'package:flutter/material.dart';
import 'package:sample_app/view/journal/journal_screen.dart';
import 'package:sample_app/widgets/components/custom_card.dart';
import '../../../utils/colors.dart';
import '../../../utils/spacer.dart';
import '../../../utils/typography.dart';

class JournalTile extends StatelessWidget {

  final String? imagePath;
  final String? taskTitle;
  final String? subTitle;

  const JournalTile({Key? key, this.taskTitle, this.subTitle, this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => const JournalScreen()));
      },
      row: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(imagePath!),
          twentyFourSpacerHorizontal,
          Column(
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
