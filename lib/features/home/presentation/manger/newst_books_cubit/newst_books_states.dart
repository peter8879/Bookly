abstract class NewestBooksStates
{

}
class  NewestBooksInitialState extends NewestBooksStates
{

}
class NewestBooksLoadingState extends NewestBooksStates
{

}
class NewestBooksSuccessState extends NewestBooksStates
{

}
class NewestBooksErrorState extends NewestBooksStates
{
  String error;
  NewestBooksErrorState(this.error);

}