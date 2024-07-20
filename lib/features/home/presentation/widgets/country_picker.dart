import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/country_pickers.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_const.dart';

class CountryPickerComponent extends StatelessWidget {
  final String currencyCode;
  final ValueChanged<Country?>? onValuePicked;
  const CountryPickerComponent(
      {super.key, required this.currencyCode, this.onValuePicked});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 120.w,
        child: CountryPickerDropdown(
          initialValue: AppConst.CURRENCY_TO_COUNTRY[currencyCode],
          itemFilter: (c) =>
              AppConst.CURRENCY_TO_COUNTRY.values.contains(c.isoCode),
          itemBuilder: (country) => Row(
            children: <Widget>[
              CountryPickerUtils.getDefaultFlagImage(country),
              const SizedBox(
                width: 8.0,
              ),
              Text("${country.currencyCode}"),
            ],
          ),
          onValuePicked: onValuePicked,
        ));
  }
}
