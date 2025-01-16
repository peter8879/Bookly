import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:bookly/features/home/presentation/manger/newst_books_cubit/newst_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksStates>
{
  List<BookModel> newestBooks=[];
  HomeRepo homeRepo;
  NewestBooksCubit(this.homeRepo):super(NewestBooksInitialState());
  static NewestBooksCubit get(context)=> BlocProvider.of(context);
  void getNewestBooks() async
  {
    emit(NewestBooksLoadingState());
    var result=await homeRepo.fetchNewestBooks();
    result.fold((failure) {
      emit(NewestBooksErrorState(failure.toString()));
    }, (books) {
      newestBooks=books;
      emit(NewestBooksSuccessState());
    });

  }





}