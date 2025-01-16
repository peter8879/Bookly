import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_iteam.dart';
import 'package:bookly/features/home/presentation/views/widgets/boox_details_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/similar_boox_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  final BookModel book;
  const BookDetailsViewBody({Key? key,required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child:Padding(
            padding:  const EdgeInsetsDirectional.only(top: 30,start: 30,end: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BookDetailsCustomAppBar(),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 15),
                  child: Center(
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height*0.35,
                        child:  BookItem(image: book.volumeInfo.imageLinks==null?'https://purepng.com/public/uploads/large/purepng.com-booksbookillustratedwrittenprintedliteratureclipart-1421526451707uyace.png':book.volumeInfo.imageLinks!.thumbnail,)
                    ),
                  ),
                ),
                const SizedBox(height: 30.0,),
                BookDetailsSection(book:this.book,),
                const Expanded(child: SizedBox(height: 20.0,)),
                Text(
                  'You can also like',
                  style: Styles.textStyle14.copyWith(
                      fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(height: 10.0,),
                const SimilarBoxListView(),
                const SizedBox(height: 40.0,),



              ],
            ),
          )
        )
      ],
    );

  }
}







