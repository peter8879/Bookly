import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/dio_helper.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpel extends SearchRepo
{
  DioHelper dio;
  SearchRepoImpel(this.dio);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearch(String keyWord) async {
    List<BookModel>books=[];
    try{
      var data=await dio.get(url:'volumes?q=$keyWord+intitle' );

      data['items'].forEach((element){
        books.add(BookModel.fromJson(element));

      });
      return right(books);

    }
    catch(error){
      if(error is DioException){
        return left(ServerFailure.fromDioError(dioError: error));
      }
      return left(ServerFailure('Un exepected error'));


    }

  }

}