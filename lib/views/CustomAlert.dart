import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myhotel/utils/Globals.dart';
import 'package:myhotel/views/CustomButton.dart';
import 'package:myhotel/views/CustomTextField.dart';

class CustomAlert extends StatefulWidget {
  final String heading;
  final String text;
  final Function(String name, List<DateTime?> dates)? callback;
  CustomAlert(this.heading, this.text, {this.callback, super.key});

  @override
  State<CustomAlert> createState() => _CustomAlertState();
}

class _CustomAlertState extends State<CustomAlert> {
  TextEditingController nameController = TextEditingController();
  List<DateTime?> _dates = [];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SingleChildScrollView(
        child: Container(
          height: 600,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.heading,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Globals.pop();
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                CustomTextField(
                  controller: nameController,
                  hintText: "Full Name",
                ),
                CalendarDatePicker2(
                  config: CalendarDatePicker2Config(
                    calendarType: CalendarDatePicker2Type.range,
                  ),
                  value: _dates,
                  onValueChanged: (dates) => _dates = dates,
                ),
                SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomButton(
                      buttonText: "Assign Guest",
                      isLoading: false,
                      onPressed: () =>
                          widget.callback!(nameController.text, _dates),
                    ),
                    Container(height: 5),
                    CustomButton(
                      buttonText: 'Cancel',
                      isLoading: false,
                      onPressed: () => Globals.pop(),
                      buttonTextColor: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
