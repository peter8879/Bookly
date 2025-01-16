import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookDetailsCustomAppBar extends StatelessWidget {
  const BookDetailsCustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        IconButton(
          onPressed: (){
            GoRouter.of(context).pushReplacement(AppRouter.kHomeView);

          },
          icon: const Icon(Icons.close,size: 31.52,),
        ),
        const Spacer(),
        IconButton(
          onPressed: (){

          },
          icon: const Icon(Icons.shopping_cart_outlined,size: 31.52,),
        ),


      ],
    );
  }
}