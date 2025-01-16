
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [

        SliverToBoxAdapter(
          child:Padding(
            padding:  EdgeInsetsDirectional.only(top: 48,start: 30,end: 30),
            child:   Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                SizedBox(height: 46.9,),
                FeaturedBooksListView(),
                SizedBox(height: 49,),
                Text(
                  'Best Seller',
                  style: Styles.textStyle18,
                ),
                SizedBox(height: 20.0,),

              ],

            ),
          ),
        ),
        SliverToBoxAdapter(
          child:Padding(
            padding:   EdgeInsets.symmetric(horizontal: 30.0),
            child:   BestSellerListView(),
          ),



        ),
      ],
    );

  }
}








