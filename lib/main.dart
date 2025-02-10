import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/presentation/manger/featured_books_cubit/cubit.dart';
import 'package:bookly/features/home/presentation/manger/newst_books_cubit/newst_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/home/data/repos/home_repo.dart';


void main() async{

  setup();
  Bloc.observer = MyBlocObserver();
  runApp( const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (context)=>FeaturedBooksCubit(getIt.get<HomeRepo>())..fetchFeaturedBooks(),
    ),
        BlocProvider(
          create:(context)=> NewestBooksCubit(getIt.get<HomeRepo>())..getNewestBooks(),
        ),
      ],
      child: MaterialApp.router(

    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark().copyWith(
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: mainColor
        )
      ),

    scaffoldBackgroundColor: mainColor,
    textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)
    ),
    routerConfig: AppRouter.router,
    ),
    );





  }
}


