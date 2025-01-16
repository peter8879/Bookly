import 'package:dio/dio.dart';

abstract class Failure
{

final String error;
const Failure(this.error);
}
class ServerFailure extends Failure
{
ServerFailure(super.error);
 factory ServerFailure.fromDioError({required DioError dioError})
{
  switch(dioError.type){
    case(DioExceptionType.sendTimeout):
      return ServerFailure('Send Time Out');

    case(DioExceptionType.connectionTimeout):
      return ServerFailure('Connection Time Out');
    case(DioExceptionType.receiveTimeout):
      return ServerFailure('receive Time Out');
    case(DioExceptionType.badResponse):
      return ServerFailure.fromResponse(dioError.response!.statusCode!, dioError.response!.data!);
    case(DioExceptionType.cancel):
      return ServerFailure('Request was canceled');
    case(DioExceptionType.badCertificate):
      return ServerFailure('Request was bad certified');
    case(DioExceptionType.connectionError):
      return ServerFailure('Connection Time Out');
    case(DioExceptionType.unknown):
      if(dioError.message!=null) {
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No internet connection');
        }
      }
      return ServerFailure('Un exepected error please try again later');



  }


}
factory ServerFailure.fromResponse(int statusCode,dynamic response)
{
  if(statusCode==400||statusCode==401||statusCode==403)
    {
      return ServerFailure(response['error']['message']);
    }
  else if(statusCode==404)
    {
      return ServerFailure('Method error');

    }
  else if(statusCode==500)
    {
      return ServerFailure('Server Error');

    }
  else
    {
      return ServerFailure('Opps there was an error please try again');
    }
}
}