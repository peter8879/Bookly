import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/features/search/presentation/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Image(
          image: AssetImage(
            AssetsData.logo,
          ),
          width: 75,
          height: 16.1,
        ),
        const Spacer(),
        IconButton(
          onPressed: (){
            GoRouter.of(context).push(AppRouter.kSearchView);

          },
          icon: const Icon(FontAwesomeIcons.magnifyingGlass,size: 25,),
        ),
      ],

    );
  }
}