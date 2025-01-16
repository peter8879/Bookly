abstract class SimilarBooksStates
{

}
class SimilarBooksInitialState extends SimilarBooksStates
{

}
class SimilarBooksLoadingState extends SimilarBooksStates
{

}
class SimilarBooksSuccessState extends SimilarBooksStates
{

}
class SimilarBooksErrorState extends SimilarBooksStates
{
final String error;
SimilarBooksErrorState(this.error);
}