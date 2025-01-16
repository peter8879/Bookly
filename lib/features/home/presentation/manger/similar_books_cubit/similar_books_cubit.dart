import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:bookly/features/home/presentation/manger/similar_books_cubit/similar_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksStates>
{
  final HomeRepo homeRepo;
  List<BookModel> similarBooks=[];
  SimilarBooksCubit(this.homeRepo):super(SimilarBooksInitialState());
 static SimilarBooksCubit get(context)=>BlocProvider.of(context);
 void fetchSimilarBooks(String subject)async
 {
   emit(SimilarBooksLoadingState());
   var data=await homeRepo.fetchSimilarBooks(subject);
   data.fold((l) {
     emit(SimilarBooksErrorState(l.error.toString()));
   }, (books) {
     similarBooks=books;
     emit(SimilarBooksSuccessState());

   });



 }
}