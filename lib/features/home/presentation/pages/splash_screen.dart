import 'package:currency_converter/core/app_assets.dart';
import 'package:currency_converter/core/app_colors.dart';
import 'package:currency_converter/core/widgets/snackbar_dialog.dart';
import 'package:currency_converter/features/home/presentation/pages/currency_converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../bloc/home_bloc.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/splash-screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    fetchCurrencyList();
    super.initState();
  }

  Future<void> fetchCurrencyList() async {
    context.read<HomeBloc>().add(FetchCurrencyList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeSuccess) {
            context.pushReplacementNamed(CurrencyConverterScreen.routeName);
          }
          if (state is HomeError) {
            SnackBarDialog.showSnackBar(context, state.error);
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.logo),
              RSizedBox(height: 30),
              Center(
                child: Text("Currency converter",
                    style: TextStyle(
                        fontFamily: 'Blackness',
                        color: AppColors.lightGreen,
                        fontSize: 36.sp)),
              ),
            ],
          );
        },
      ),
    );
  }
}
