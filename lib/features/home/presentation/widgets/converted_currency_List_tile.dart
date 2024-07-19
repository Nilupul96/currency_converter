import 'package:currency_converter/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/main_text_field.dart';

class ConvertedCurrencyListTile extends StatelessWidget {
  const ConvertedCurrencyListTile({super.key});

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
              hintText: "",
              readOnly: true,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete_outline,
                color: AppColors.red,
              ))
        ],
      ),
    );
  }
}
