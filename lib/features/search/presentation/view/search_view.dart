import 'package:bookly/features/search/presentation/view/widgets/search_view_body.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  SafeArea(
        child:  SearchViewBody(),
      ),
    );
  }
}
