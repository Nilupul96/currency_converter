import 'package:currency_converter/core/app_colors.dart';
import 'package:flutter/material.dart';

class NoInternetScreen extends StatefulWidget {
  static const routeName = "/No-internet-screen";
  const NoInternetScreen({super.key});

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "No Internet",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppColors.red),
            ),
            Text("Please check your connections",
                style: Theme.of(context).textTheme.displayMedium!)
          ],
        ),
      ),
    );
  }
}
