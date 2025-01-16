abstract class FeaturedBooksStates
{

}
 class FeaturedBooksInitialState extends FeaturedBooksStates
{

}
class FeaturedBooksLoadingState extends FeaturedBooksStates
{

}
class FeaturedBooksSuccessState extends FeaturedBooksStates
{

}
class FeaturedBooksErrorState extends FeaturedBooksStates
{
String error;
FeaturedBooksErrorState(this.error);
}
class SocialLayoutGetUserSuccessState extends FeaturedBooksStates
{

}
class SocialLayoutGetUserLoadingState extends FeaturedBooksStates
{

}
class SocialLayoutGetUserErrorState extends FeaturedBooksStates
{
 final String error;

 SocialLayoutGetUserErrorState(this.error);
}