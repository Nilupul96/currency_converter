import 'package:currency_converter/features/home/presentation/pages/currency_converter.dart';
import 'package:currency_converter/features/home/presentation/pages/currency_list_screen.dart';
import 'package:currency_converter/no_internet_screen.dart';
import 'package:go_router/go_router.dart';
import '../features/home/presentation/pages/splash_screen.dart';
import 'helpers/navigation_service.dart';

class AppRoutes {
  static GoRouter router = GoRouter(
    initialLocation: '/',
    navigatorKey: NavigationService.navigatorKey,
    routes: [
      GoRoute(
        name: SplashScreen.routeName,
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: CurrencyConverterScreen.routeName,
        path: '/currency-converter',
        builder: (context, state) => const CurrencyConverterScreen(),
      ),
      GoRoute(
        name: CurrencyListScreen.routeName,
        path: '/currency-list',
        builder: (context, state) => CurrencyListScreen(
          baseCurrencyCode: state.extra as String,
        ),
      ),
      GoRoute(
        name: NoInternetScreen.routeName,
        path: '/no-internet',
        builder: (context, state) => const NoInternetScreen(),
      ),
    ],
  );
}
