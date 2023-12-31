import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sample_app/widgets/components/buttons/primary_button.dart';
import 'package:sample_app/widgets/components/custom_scaffold.dart';
import 'package:sample_app/widgets/components/input_field/common_text_field.dart';
import 'package:sample_app/widgets/components/input_field/dropdown_input_field.dart';
import '../../utils/colors.dart';
import '../../utils/spacer.dart';
import '../../utils/typography.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {

  final _formKey = GlobalKey<FormBuilderState>();

  final List<DropdownMenuItem<String>> itemList = const [
    DropdownMenuItem(
      value: 'Work',
      child: Text('Work'),
    ),
    DropdownMenuItem(
      value: 'Personal Project',
      child: Text('Personal Project'),
    ),
    DropdownMenuItem(
      value: 'Self',
      child: Text('Self'),
    ),
  ];

  final List<DropdownMenuItem<String>> priorityList = const [
    DropdownMenuItem(
      value: 'Needs done',
      child: Text('Needs done'),
    ),
    DropdownMenuItem(
      value: 'Nice to have',
      child: Text('Nice to have'),
    ),
    DropdownMenuItem(
      value: 'Nice idea',
      child: Text('Nice idea'),
    ),
  ];

  final List<DropdownMenuItem<String>> timeFrameList = const [
    DropdownMenuItem(
      value: 'None',
      child: Text('None'),
    ),
    DropdownMenuItem(
      value: 'Today',
      child: Text('Today'),
    ),
    DropdownMenuItem(
      value: '3 Days',
      child: Text('3 Days'),
    ),
    DropdownMenuItem(
      value: 'Week',
      child: Text('Week'),
    ),
    DropdownMenuItem(
      value: 'Fortnight',
      child: Text('Fortnight'),
    ),
    DropdownMenuItem(
      value: 'Month',
      child: Text('Month'),
    ),
    DropdownMenuItem(
      value: '90 Days',
      child: Text('90 Days'),
    ),
    DropdownMenuItem(
      value: 'Year',
      child: Text('Year'),
    ),
  ];

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
      Text(
        'New Task',
        style: title1,
      ),
      thirtyTwoSpacerVertical,
      _buildFrom(),
    ]);
  }

  FormBuilder _buildFrom() {
    return FormBuilder(
      key: _formKey,
      enabled: true,
      autovalidateMode: AutovalidateMode.disabled,
      onChanged: () {
        _formKey.currentState!.save();
      },
      child: Column(
        children: [
          const CommonTextField(
            name: 'title',
            title: 'Task',
            hintText: 'Enter the task title',
          ),
          twentyFourSpacerVertical,
          DropdownInputField(
            itemList: itemList,
            name: 'type',
            title: 'Type',
            hintText: 'Select the task type',
          ),
          twentyFourSpacerVertical,
          DropdownInputField(
            itemList: priorityList,
            name: 'priority',
            title: 'Priority',
            hintText: 'Select the priority level',
          ),
          twentyFourSpacerVertical,
          DropdownInputField(
            itemList: timeFrameList,
            name: 'timeFrame',
            title: 'Timeframe',
            hintText: 'Select the timeframe',
          ),
          twentyFourSpacerVertical,
          const CommonTextField(
            name: 'description',
            title: 'Description',
            maxLines: 6,
          ),
          const SizedBox(
            height: 64.0,
          ),
          PrimaryButton(onTap: () {}, buttonTitle: 'Submit'),
          const SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }

}
