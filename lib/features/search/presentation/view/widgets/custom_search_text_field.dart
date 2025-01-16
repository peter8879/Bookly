import 'package:bookly/features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatefulWidget {

 CustomSearchTextField({Key? key}) : super(key: key);

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  var textController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value){
        SearchCubit.get(context).getSearch(value);
      },
      controller: textController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: 'Type Book Name To search',
        suffixIcon: IconButton(
          icon:  Icon(FontAwesomeIcons.magnifyingGlass,size: 22,
            color: Colors.white.withOpacity(0.8),),
          onPressed: (){

          },
        ),
      ),
    );
  }
  @override
  void dispose() {
   textController.dispose();
    super.dispose();
  }
}