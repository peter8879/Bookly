abstract class SearchStates
{

}
class SearchInitialState extends SearchStates
{

}
class LoadingSearch extends SearchStates
{

}
class SuccessSearch extends SearchStates
{

}
class ErrorSearch extends SearchStates
{
  String error;
  ErrorSearch(this.error);

}
