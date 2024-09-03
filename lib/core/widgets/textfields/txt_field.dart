import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/app_colors.dart';

class TxtField extends StatelessWidget {
  const TxtField({
    super.key,
    required this.controller,
    required this.hintText,
    this.multiline = false,
    this.number = false,
    this.length = 30,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final bool multiline;
  final bool number;
  final int length;
  final void Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.textField,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        keyboardType: multiline
            ? TextInputType.multiline
            : number
                ? TextInputType.number
                : null,
        maxLines: multiline ? null : 1,
        inputFormatters: [
          LengthLimitingTextInputFormatter(length),
          // FilteringTextInputFormatter.allow(RegExp("[a-zA-Zа-яА-Я]")),
          if (number) FilteringTextInputFormatter.digitsOnly,
        ],
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 16,
          fontFamily: Fonts.sfM,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 16,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.white14,
            fontSize: 16,
            fontFamily: Fonts.sfM,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onChanged: (value) {
          onChanged();
        },
      ),
    );
  }
}

// 1
//  date_picker_plus: ^4.1.0
// 2
//  readOnly: true,
// 3
// onTap: () async {
//     final date = await showDatePickerDialog(
//         context: context,
//         leadingDateTextStyle: const TextStyle(
//           color: AppColors.purple1,
//           fontWeight: FontWeight.w700,
//           fontFamily: 'InterB',
//         ),
//         enabledCellsTextStyle: const TextStyle(
//           color: AppColors.black,
//         ),
//         currentDateTextStyle: const TextStyle(
//           color: AppColors.white,
//         ),
//         currentDateDecoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(100),
//           color: const Color(0xffFB41FF),
//           // border: Border.all(color: const Color(0xffFB41FF)),
//         ),
//         disabledCellsTextStyle: const TextStyle(
//           color: AppColors.black,
//           fontSize: 12,
//           fontWeight: FontWeight.w500,
//           fontFamily: 'InterM',
//         ),
//         daysOfTheWeekTextStyle: const TextStyle(
//           color: Color(0xff3d3d40),
//           fontSize: 12,
//           fontWeight: FontWeight.w600,
//           fontFamily: 'InterM',
//         ),
//         splashColor: AppColors.pink1,
//         highlightColor: AppColors.pink1,
//         slidersColor: AppColors.purple1,
//         currentDate: controller.text.isEmpty
//             ? DateTime.now()
//             : convertToDateTime(controller.text),
//         minDate: DateTime(2020, 1, 1),
//         maxDate: DateTime(2030, 1, 1),
//         padding: EdgeInsets.zero,
//         contentPadding: const EdgeInsets.all(24),
//         height: 318,
//     );
//     if (date != null) {
//         onDate(formatDateTime(date));
//     }
// },