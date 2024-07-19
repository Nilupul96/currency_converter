import 'package:get_it/get_it.dart';
import '../features/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerFactory<HomeBloc>(() => HomeBloc());
  // sl.registerLazySingleton<GetTopArticleUseCase>(
  //     () => GetTopArticleUseCase(sl<ArticleRepository>()));
  // sl.registerLazySingleton<GetAllArticleUseCase>(
  //     () => GetAllArticleUseCase(sl<ArticleRepository>()));
  // sl.registerLazySingleton<ArticleRepository>(
  //     () => ArticleRepositoryImpl(sl<ArticleService>()));
  // sl.registerLazySingleton<ArticleService>(() => ArticleServiceImpl());
}
