import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../app_colors.dart';
import '../widgets/main_btn.dart';

class CommonDialog {
  static showCommonDialog(BuildContext context, String title,
      Widget contentWidget, String onCancelBtnText, String onClickBtnText,
      {Function? onCancel, Function? onClick, double titleSize = 23.0}) {
    AlertDialog alert = AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
      ),
      title: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      content: contentWidget,
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 60,
                padding: const EdgeInsets.only(bottom: 20, left: 20),
                child: MainBtn(
                  lbl: onCancelBtnText,
                  bgColor: Colors.grey,
                  onClick: onCancel ?? () {},
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Container(
                height: 60,
                padding: const EdgeInsets.only(bottom: 20, right: 20),
                child: MainBtn(
                  lbl: onClickBtnText,
                  bgColor: AppColors.bgBlue,
                  onClick: onClick ?? () {},
                ),
              ),
            ),
          ],
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static showErrorDialog(BuildContext context, String title, String content) {
    AlertDialog alert = AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      backgroundColor: Colors.grey,
      title: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(title, style: Theme.of(context).textTheme.displayLarge),
          ],
        ),
      ),
      content: Text(
        content,
        style: Theme.of(context).textTheme.displaySmall,
        textAlign: TextAlign.center,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Container(
          height: 60,
          padding: const EdgeInsets.only(bottom: 20, right: 20),
          child: MainBtn(
            lbl: "Ok",
            bgColor: AppColors.lightGreen,
            onClick: () => context.pop(),
          ),
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
