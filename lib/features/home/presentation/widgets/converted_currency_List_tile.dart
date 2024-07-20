import 'package:currency_converter/features/home/presentation/widgets/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/main_text_field.dart';

class ConvertedCurrencyListTile extends StatelessWidget {
  final String value;
  final String currencyCode;
  const ConvertedCurrencyListTile(
      {super.key, required this.value, required this.currencyCode});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        children: [
          Expanded(
            child: CustomTextFormField(
                labelText: "",
                keyboardType: TextInputType.number,
                textEditingController: TextEditingController(),
                hintText: value,
                readOnly: true,
                suffixIcon: CountryPickerComponent(
                  currencyCode: currencyCode,
                  onValuePicked: (country) {},
                )),
          ),
        ],
      ),
    );
  }
}
