import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/box_action.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  final BookModel book;
  const BookDetailsSection({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child:  Text(

            book.volumeInfo.title!,
            style: Styles.textStyle30,
            textAlign: TextAlign.center,

          ),
        ),
        const SizedBox(height: 6.0,),
        Center(
          child:  Text(
            '${book.volumeInfo.authors![0]}',
            style: Styles.textStyle18.copyWith(
                color: Colors.white.withOpacity(0.7),
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600

            ),

          ),
        ),
        const SizedBox(height: 10,),
         const BookRating(mainAxisAlignment: MainAxisAlignment.center,rating: 3.8,count: 3,),
        const SizedBox(height: 20.0,),
         BooksAction(bookModel: book,),

      ],
    );
  }
}