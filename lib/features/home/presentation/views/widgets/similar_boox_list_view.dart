import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/manger/similar_books_cubit/similar_books_states.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_iteam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarBoxListView extends StatelessWidget {
  const SimilarBoxListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<SimilarBooksCubit,SimilarBooksStates>(
      builder: (context,state){
        if(state is SimilarBooksSuccessState)
          {
            return SizedBox(
              height: MediaQuery.of(context).size.height*0.17  ,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index)=>  GestureDetector(
                  onTap: (){
                    GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: SimilarBooksCubit.get(context).similarBooks[index]);
                  },
                    child: BookItem(image:SimilarBooksCubit.get(context).similarBooks[index].volumeInfo.imageLinks!.thumbnail ,)
                ),
                itemCount:SimilarBooksCubit.get(context).similarBooks.length,
                separatorBuilder: (context,index)=> const SizedBox(width: 8.0,),
              ),
            );
          }
        else if(state is SimilarBooksErrorState)
        {
          return CustomErrorWidget(error: state.error);
        }
        else
          {
            return const CustomLoadingIndicator();
          }


      },
    );
  }
}
