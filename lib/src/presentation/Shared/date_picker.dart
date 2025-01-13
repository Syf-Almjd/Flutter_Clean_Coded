import 'package:flutter_clean_coded/src/core/themes/styles/app_colors.dart';
import 'package:flutter_clean_coded/src/core/themes/styles/app_fonts.dart';
import 'package:flutter_clean_coded/src/presentation/Shared/components.dart';
import 'package:flutter_clean_coded/src/presentation/Shared/widgets_builder.dart';
import 'package:flutter_clean_coded/src/presentation/state/navigation_cubit/navi_cubit.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePicker extends StatelessWidget {
  final String title;
  final bool isFromToSelection;
  final Function() onDone;

  const DatePicker(
      {super.key,
      required this.title,
      required this.onDone,
      required this.isFromToSelection});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textC(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: getHeight(60, context),
              width: getWidth(80, context),
              child: SfDateRangePicker(
                showTodayButton: false,
                enablePastDates: false,
                todayHighlightColor: AppColors.white,
                selectionMode: DateRangePickerSelectionMode.range,
                onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
                  setCalenderSelectedValue(
                    dateRangePickerSelectionChangedArgs.value,
                  );
                },
              ),
            ),
            loadButton(
                context: context,
                onPressed: () async {
                  if (datesValues.startDate == null ||
                      datesValues.endDate == null) {
                    showToast("Please choose starting and ending dates...",
                        AppColors.primaryColor, context);
                    return;
                  }
                  await onDone();

                  if (context.mounted) {
                    NaviCubit.get(context).pop(context);
                  }
                },
                buttonText: "Select",
                fontSize: AppFontSize.s16,
                borderCurveSize: 10)
          ],
        ),
      ),
    );
  }
}

PickerDateRange datesValues = PickerDateRange(DateTime.now(), DateTime.now());

setCalenderSelectedValue(pickerDateRange) {
  datesValues = pickerDateRange;
}

PickerDateRange getCalenderSelectedValue() {
  if (datesValues.startDate == null || datesValues.endDate == null) {
    return PickerDateRange(DateTime.now(), DateTime.now());
  }
  return datesValues;
}
