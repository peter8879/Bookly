import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/dio_helper.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo
{
  DioHelper dioHelper;
HomeRepoImpl(this.dioHelper);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async{
    List<BookModel> books=[];

    try{

      var data=await dioHelper.get(url: 'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science');
      data['items'].forEach((element){
        books.add(BookModel.fromJson(element));
      });
      //for(var item in data['items'])
      //{
        //books.add(BookModel.fromJson(item));
      //}
      return right(books);

    }
    catch(error)
    {
      if(error is DioError||error is DioException) {
        return left(ServerFailure.fromDioError(dioError: error));
      }
      return Future(() => left(ServerFailure('Un expected error')));


    }

  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async{
    List<BookModel> books=[];
    try{

      var data=await dioHelper.get(url: 'volumes?Filtering=free-ebooks&q=subject:programming');
      for(var item in data['items'])
      {
        books.add(BookModel.fromJson(item));
      }
      return right(books);

    }
    catch(error)
    {
      if(error is DioError||error is DioException) {
        return left(ServerFailure.fromDioError(dioError: error));
      }
      return Future(() => left(ServerFailure('Un expected error')));


    }

  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(String subject) async{
    
    try{
      List<BookModel>books=[];
      var data= await dioHelper.get(url: 'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:$subject');
      for(var item in data['items'])
        {
          books.add(BookModel.fromJson(item));
        }
      return right(books);
    }
    catch(error){
      if(error is DioError||error is DioException)
        {
          return left(ServerFailure.fromDioError(dioError: error));
        }
      return left(ServerFailure('Un exepected error'));
    }

  }
















}