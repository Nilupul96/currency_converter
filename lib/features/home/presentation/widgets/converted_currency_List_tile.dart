import 'package:country_currency_pickers/country.dart';
import 'package:currency_converter/features/home/presentation/widgets/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/widgets/main_text_field.dart';

class ConvertedCurrencyListTile extends StatefulWidget {
  final String value;
  final String currencyCode;
  final ValueChanged<Country?>? onCountryPicked;
  final Function removeCurrency;
  const ConvertedCurrencyListTile(
      {super.key,
      required this.value,
      required this.currencyCode,
      this.onCountryPicked,
      required this.removeCurrency});

  @override
  State<ConvertedCurrencyListTile> createState() =>
      _ConvertedCurrencyListTileState();
}

class _ConvertedCurrencyListTileState extends State<ConvertedCurrencyListTile>
    with SingleTickerProviderStateMixin {
  late final controller = SlidableController(this);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: Slidable(
          key: const ValueKey(0),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (_) {
                  controller.openEndActionPane();
                  widget.removeCurrency();
                },
                backgroundColor: AppColors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                    labelText: "",
                    keyboardType: TextInputType.number,
                    textEditingController: TextEditingController(),
                    hintText: widget.value,
                    readOnly: true,
                    suffixIcon: CountryPickerComponent(
                      currencyCode: widget.currencyCode,
                      onValuePicked: widget.onCountryPicked,
                    )),
              ),
            ],
          ),
        ));
  }
}
