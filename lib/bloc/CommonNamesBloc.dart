
class SearchBLoc extends Bloc<SearchEvent,SearchState>{
  SearchBLoc(): super(CheckSEARCH()){
    
  }
}









class CheckSEARCH  extends SearchEvent{}
class CheckingSearch extends SearchState{}
class CheckedState extends SearchState{}
class SearchError extends SearchState{}


class SearchEvent {}
class SearchState{}