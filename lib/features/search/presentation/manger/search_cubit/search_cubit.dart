import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:bookly/features/search/presentation/manger/search_cubit/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates>
{
  SearchCubit(this.searchRepo):super(SearchInitialState());
  static SearchCubit get(context)=>BlocProvider.of(context);
  List<BookModel> book=[];
  SearchRepo searchRepo;
  void getSearch(String keyWord)async
  {
    emit(LoadingSearch());
    var data=await searchRepo.fetchSearch(keyWord);
    data.fold((l) {
      emit(ErrorSearch(l.error));

    }, (r) {
      book=[];
      book=r;
      emit(SuccessSearch());

    });


  }

}