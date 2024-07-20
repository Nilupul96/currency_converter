import 'package:currency_converter/core/app_assets.dart';
import 'package:currency_converter/core/app_colors.dart';
import 'package:currency_converter/core/helpers/connectivity_manager.dart';
import 'package:currency_converter/core/widgets/snackbar_dialog.dart';
import 'package:currency_converter/features/home/presentation/pages/currency_converter.dart';
import 'package:currency_converter/no_internet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/common_dialog.dart';
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
    bool isInternetAvailable = await ConnectivityManager.connected();
    if (!context.mounted) return;
    if (isInternetAvailable) {
      context.read<HomeBloc>().add(FetchCurrencyList());
    } else {
      context.goNamed(NoInternetScreen.routeName);
    }
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
            CommonDialog.showErrorDialog(context, "Oops", state.error);
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.logo),
              const RSizedBox(height: 30),
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
