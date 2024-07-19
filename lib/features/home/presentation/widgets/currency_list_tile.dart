import 'package:currency_converter/features/home/domain/entities/currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyListTile extends StatefulWidget {
  final Currency currency;
  const CurrencyListTile({super.key, required this.currency});

  @override
  State<CurrencyListTile> createState() => _CurrencyListTileState();
}

class _CurrencyListTileState extends State<CurrencyListTile> {
  bool isSelect = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: CheckboxListTile(
        title: Text("${widget.currency.name}   (${widget.currency.symbol})"),
        value: isSelect,
        onChanged: (value) {
          setState(() {
            isSelect = value!;
          });
        },
      ),
    );
  }
}
