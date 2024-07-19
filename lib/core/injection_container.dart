import 'package:currency_converter/features/home/domain/usecases/fetch_currency_list_usecase.dart';
import 'package:get_it/get_it.dart';
import '../features/home/data/datasources/home_service.dart';
import '../features/home/data/repositories/home_repository_impl.dart';
import '../features/home/domain/repositories/home_repository.dart';
import '../features/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerFactory<HomeBloc>(() => HomeBloc(sl<FetchCurrencyListUseCase>()));
  sl.registerLazySingleton<FetchCurrencyListUseCase>(
      () => FetchCurrencyListUseCase(sl<HomeRepository>()));
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(sl<HomeService>()));
  sl.registerLazySingleton<HomeService>(() => HomeServiceImpl());
}
