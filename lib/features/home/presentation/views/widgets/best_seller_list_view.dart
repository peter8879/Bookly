import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/features/home/presentation/manger/newst_books_cubit/newst_books_cubit.dart';
import 'package:bookly/features/home/presentation/manger/newst_books_cubit/newst_books_states.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit,NewestBooksStates>(
      builder: (context,state){
        if(state is NewestBooksLoadingState)
          {
            return const Center(child: CircularProgressIndicator());
          }
        else if(state is NewestBooksErrorState)
          {

            return Center(child: CustomErrorWidget(error: state.error));
          }
        else
          {
            return  ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context,index)=>BestSellerListViewItem(book: NewestBooksCubit.get(context).newestBooks[index]),
              itemCount: NewestBooksCubit.get(context).newestBooks.length,
              separatorBuilder: (context,index)=> const SizedBox(height: 20.0,),
            );
          }
      },
    );
  }
}