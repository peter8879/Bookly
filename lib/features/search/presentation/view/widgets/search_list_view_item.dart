import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_iteam.dart';
import 'package:flutter/material.dart';

class SearchListViewItem extends StatelessWidget {
  final BookModel book;
  const SearchListViewItem({super.key,required this.book});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        SizedBox(

            height: MediaQuery.of(context).size.height*0.17,

            child:  BookItem(image: book.volumeInfo.imageLinks!.thumbnail,),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              book.volumeInfo.title!,
              style: Styles.textStyle18,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
      ],
    );
  }
}
