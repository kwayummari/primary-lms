import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plms/src/utils/constants/app_const.dart';
import 'package:plms/src/widgets/app_text.dart';

class CustomizableDatePicker extends StatefulWidget {
  final String title;
  final String? header;
  final Function(DateTime) onDateSelected;
  final Color backgroundColor;
  final Color buttonColor;
  final Color selectedColor;
  final Color todayColor;
  final Color textColor;

  const CustomizableDatePicker({
    Key? key,
    this.header,
    required this.title,
    required this.onDateSelected,
    required this.backgroundColor,
    required this.buttonColor,
    required this.selectedColor,
    required this.todayColor,
    required this.textColor,
  }) : super(key: key);

  @override
  _CustomizableDatePickerState createState() => _CustomizableDatePickerState();
}

class _CustomizableDatePickerState extends State<CustomizableDatePicker> {
  late DateTime _selectedDate;
  late DateFormat _dateFormat;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now().toLocal();
    _selectedDate =
        DateTime(_selectedDate.year, _selectedDate.month, _selectedDate.day);
    _dateFormat = DateFormat('dd/MM/yyyy');
  }

  void _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(now.year, 12, 31),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.onDateSelected(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.header != null)
          Align(
            alignment: Alignment.centerLeft,
            child: AppText(
              txt: widget.header,
              size: 15,
              color: AppConst.secondary,
              weight: FontWeight.w900,
            ),
          ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            _selectDate(context);
          },
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              border: Border.all(
                color: widget.buttonColor,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  color: AppConst.primary,
                ),
                SizedBox(
                  width: 10,
                ),
                AppText(
                  txt: _dateFormat.format(_selectedDate),
                  color: AppConst.secondary,
                  size: 18,
                  weight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
