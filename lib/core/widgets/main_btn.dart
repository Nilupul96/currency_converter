import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../app_colors.dart';

class MainBtn extends StatefulWidget {
  final String lbl;
  final Function onClick;
  final bool isLoading;
  final bool isEnabled;
  final Color bgColor;
  final String? icon;
  final bool disableSplash;

  const MainBtn(
      {Key? key,
      this.lbl = "",
      required this.bgColor,
      required this.onClick,
      this.isLoading = false,
      this.isEnabled = true,
      this.disableSplash = false,
      this.icon})
      : super(key: key);

  @override
  State<MainBtn> createState() => _MainBtnState();
}

class _MainBtnState extends State<MainBtn> {
  bool showAnim = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: !widget.isEnabled ? AppColors.bgBlue : widget.bgColor,
            elevation: 0.0,
            splashFactory: widget.disableSplash
                ? NoSplash.splashFactory
                : InkRipple.splashFactory,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: widget.isEnabled
              ? !widget.isLoading
                  ? () async {
                      await widget.onClick();
                    }
                  : null
              : null,
          child: widget.isLoading
              ? const SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.transparent,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.lbl,
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: AppColors.black)),
                    if (widget.icon != null)
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 10.w),
                          child: Image.asset(widget.icon!))
                  ],
                )),
    );
  }
}
