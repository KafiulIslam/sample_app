import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/view/home/home_screen.dart';
import 'package:sample_app/widgets/components/buttons/primary_button.dart';
import 'package:sample_app/widgets/components/custom_scaffold.dart';
import '../../controller/app_constant.dart';
import '../../utils/colors.dart';
import '../../utils/constant.dart';
import '../../utils/spacer.dart';
import '../../utils/typography.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({Key? key}) : super(key: key);

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {

  final TextEditingController _journalController = TextEditingController();
  Client client = Client();
  late Databases db;
  late bool isLoading = false;

  Future<void> addJournal(String journalText) async {
    try {

      setState(() {
        isLoading = true;
      });

      var res = await db.createDocument(
          databaseId: AppConstant.journalDatabaseId,
          collectionId: AppConstant.journalItemCollectionId,
          documentId: ID.unique(),
          data: {
            'journal': journalText,
          });
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));

      print('post response is $res');
    } catch (e) {
      print(e.toString());
    }finally{
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    client.setEndpoint(AppConstant.endPoint).setProject(AppConstant.projectId);
    db = Databases(client);    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final double screenHeight = MediaQuery.of(context).size.height;

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
      Text(
        'Journal',
        style: title1,
      ),
      thirtyTwoSpacerVertical,
      TextFormField(
        controller: _journalController,
        maxLines: 10,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(16),
          hintText: 'Text',
          hintStyle: hintTextStyle,
          focusedBorder: focusedBorder,
          enabledBorder: enableBorder,
          errorBorder: enableBorder,
          focusedErrorBorder: focusedBorder,
          focusColor: primaryColor,
        ),
      ),
      SizedBox(height: screenHeight / 4,),
      PrimaryButton(buttonTitle: 'Submit', onTap: (){
        addJournal(_journalController.text);
      },)
     ]);
  }
}
