import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:bookly/features/search/presentation/manger/search_cubit/search_states.dart';
import 'package:bookly/features/search/presentation/view/widgets/search_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return BlocBuilder<SearchCubit,SearchStates>(
     builder: (context,state){
       if(state is LoadingSearch)
         {
           return const CustomLoadingIndicator();
         }
       if(state is ErrorSearch)
         {
           return CustomErrorWidget(error: state.error);
         }
       else
         {
           return ListView.separated(
             shrinkWrap: true,
             physics: const NeverScrollableScrollPhysics(),
             padding: EdgeInsets.zero,
             itemBuilder: (context,index)=> InkWell(
               onTap: (){
                 GoRouter.of(context).push(AppRouter.kBookDetailsView,extra:SearchCubit.get(context).book[index] );
               },
                 child: SearchListViewItem(book: SearchCubit.get(context).book[index],)
             ),
             itemCount: SearchCubit.get(context).book.length,
             separatorBuilder: (context,index)=> const SizedBox(height: 20.0,),
           );
         }
     },
   );
  }
}