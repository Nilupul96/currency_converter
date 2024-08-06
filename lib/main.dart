import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/app_routes.dart';
import 'core/app_theme.dart';
import 'core/helpers/app_logger.dart';
import 'core/injection_container.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Log.info("account details---${dotenv.env['API_KEY']!}");
    return ScreenUtilInit(
        designSize: const Size(392, 783),
        minTextAdapt: true,
        builder: (_, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<HomeBloc>(create: (context) => sl()),
            ],
            child: MaterialApp.router(
              title: 'Currency converter',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.appLightTheme,
              themeMode: ThemeMode.dark,
              darkTheme: AppTheme.darkTheme,
              routerConfig: AppRoutes.router,
            ),
          );
        });
  }
}
