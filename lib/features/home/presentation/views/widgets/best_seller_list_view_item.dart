import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_iteam.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key,required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: book,);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            BookItem(image: book.volumeInfo.imageLinks!=null?book.volumeInfo.imageLinks!.thumbnail:'https://purepng.com/public/uploads/large/purepng.com-booksbookillustratedwrittenprintedliteratureclipart-1421526451707uyace.png'),
            const SizedBox(width: 30.0,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(top: 10.0),
                      child: Text(
                        book.volumeInfo.title!,
                        style: Styles.textStyle20.copyWith(
                            fontFamily: KGtSectraFine
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3,),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      book.volumeInfo.authors![0],
                      style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w500,color: Colors.grey),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,

                    ),
                  ),
                  const SizedBox(width: 3,),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
                      ),
                     const SizedBox(width: 20.0,),
                     BookRating(count: book.volumeInfo.ratingsCount??0,rating: book.volumeInfo.averageRating??0,),

                    ],
                  ),

                ],
              ),
            )

          ],

        ),
      ),
    );
  }
}
