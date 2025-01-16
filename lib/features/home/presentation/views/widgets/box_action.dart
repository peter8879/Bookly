import 'package:bookly/core/widgets/customButton.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({Key? key,required this.bookModel}) : super(key: key);
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsetsDirectional.only(start: 8.0,end: 8.0),
      child: Row(
        children: [
         const Expanded(
              child:  CustomButton(

                buttonColor: Colors.white,
                textColor: Colors.black,
                borderRadius: BorderRadius.only(topLeft:  Radius.circular(12.0),bottomLeft:  Radius.circular(12.0)),
                text: 'Free',
              )
          ),
          if(bookModel.volumeInfo.previewLink!=null)
          Expanded(
              child:  CustomButton(
                buttonColor: Color(0xffEF8262),
                textColor: Colors.white,
                borderRadius: BorderRadius.only(topRight:  Radius.circular(12.0),bottomRight:  Radius.circular(12.0)),
                text: 'Preview',
                onPressed: ()async{
                  Uri uri=Uri.parse(bookModel.volumeInfo.previewLink!);
                  if(await canLaunchUrl(uri))
                  {
                    await launchUrl(uri);
                  }

                },
              )
          ),
          if(bookModel.volumeInfo.previewLink==null)
           const  Expanded(
                child:  CustomButton(
                  buttonColor: Color(0xffEF8262),
                  textColor: Colors.white,
                  borderRadius: BorderRadius.only(topRight:  Radius.circular(12.0),bottomRight:  Radius.circular(12.0)),
                  text: 'Not Available',
                )
            ),



        ],
      ),
    );
  }
}