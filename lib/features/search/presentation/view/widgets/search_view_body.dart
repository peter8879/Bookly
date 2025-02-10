import 'package:bookly/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly/features/search/presentation/view/widgets/custom_search_text_field.dart';
import 'package:bookly/features/search/presentation/view/widgets/search_list_view.dart';
import 'package:bookly/features/search/presentation/view/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding:   const EdgeInsets.symmetric(horizontal: 30.0,vertical: 20.0),
            child: Column(
              children: [
                CustomSearchTextField(),
                const SizedBox(height: 20.0,),



              ],
            ),
          ),
        ),
        const SliverFillRemaining(
          child: SearchListView(),
        )
      ],
    );
  }
}




