import 'package:currency_converter/features/home/presentation/pages/currency_converter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/splash-screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    handleNavigation();
    super.initState();
  }

  Future<void> handleNavigation() async {
    Future.delayed(Duration(seconds: 2), () {
      context.pushReplacementNamed(CurrencyConverterScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Currency converter",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          )
        ],
      ),
    );
  }
}
