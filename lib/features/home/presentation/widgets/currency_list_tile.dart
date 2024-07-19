import 'package:currency_converter/features/home/domain/entities/currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyListTile extends StatefulWidget {
  final Currency currency;
  final bool isSelected;
  final ValueSetter<bool> onSelect;
  const CurrencyListTile(
      {super.key,
      required this.currency,
      required this.isSelected,
      required this.onSelect});

  @override
  State<CurrencyListTile> createState() => _CurrencyListTileState();
}

class _CurrencyListTileState extends State<CurrencyListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: CheckboxListTile(
        title: Text("${widget.currency.name}   (${widget.currency.symbol})"),
        value: widget.isSelected,
        onChanged: (value) => widget.onSelect(value!),
      ),
    );
  }
}
