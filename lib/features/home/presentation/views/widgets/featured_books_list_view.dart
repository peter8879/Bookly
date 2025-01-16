import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/manger/featured_books_cubit/cubit.dart';
import 'package:bookly/features/home/presentation/manger/featured_books_cubit/states.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_iteam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {

  const FeaturedBooksListView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<FeaturedBooksCubit,FeaturedBooksStates>(
      builder: (context,state){
        if(state is FeaturedBooksSuccessState)
          {

            return  SizedBox(
              height: MediaQuery.of(context).size.height*0.3  ,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  String image='https://purepng.com/public/uploads/large/purepng.com-booksbookillustratedwrittenprintedliteratureclipart-1421526451707uyace.png';

                  if(FeaturedBooksCubit.get(context).books[index].volumeInfo.imageLinks!=null)
                    {
                      image=FeaturedBooksCubit.get(context).books[index].volumeInfo.imageLinks!.thumbnail;
                    }
                  return GestureDetector(
                    onTap: (){
                      GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: FeaturedBooksCubit.get(context).books[index] );
                    },
                      child: BookItem(image:image ,)
                  );
                },
                itemCount: FeaturedBooksCubit.get(context).books.length,
                separatorBuilder: (context,index)=> const SizedBox(width: 8.0,),
              ),
            );
          }
        else if(state is FeaturedBooksErrorState)
          {
            return Center(child: CustomErrorWidget(error: state.error));

          }
        else
          {
            return const CustomLoadingIndicator();
          }
      },
    );
  }
}