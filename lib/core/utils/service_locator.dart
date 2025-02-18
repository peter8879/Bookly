import 'package:bookly/core/utils/dio_helper.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/search/data/repos/search_repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repos/home_repo.dart';
import '../../features/search/data/repos/search_repo.dart';

final getIt = GetIt.instance;
void setup()
{

  getIt.registerSingleton(DioHelper(Dio()));
getIt.registerSingleton<HomeRepo>(HomeRepoImpl(getIt.get<DioHelper>()));
  getIt.registerSingleton<SearchRepo>(SearchRepoImpel(getIt.get<DioHelper>()));
}