
import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:bookly/features/home/presentation/manger/featured_books_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksStates>
{

  FeaturedBooksCubit(this.homeRepo):super(FeaturedBooksInitialState());
  final HomeRepo homeRepo;
  static FeaturedBooksCubit get (context)=>BlocProvider.of(context);
  List<BookModel> books=[];
  void fetchFeaturedBooks()async{
    emit(FeaturedBooksLoadingState());
    var result=await homeRepo.fetchFeaturedBooks();
    result.fold((l) {
      emit(FeaturedBooksErrorState(l.error));
    }, (r) {
      books=r;
      emit(FeaturedBooksSuccessState());
    });

  }


}