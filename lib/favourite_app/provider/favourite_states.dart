import 'package:riverstate/favourite_app/model/items.dart';

class FavouriteStates {
  final List<Itemss> allItems;
  final List<Itemss> favouriteItems;
  final String search;

  FavouriteStates({required this.allItems,required this.favouriteItems,required this.search});


  FavouriteStates copyWith({
    List<Itemss>? allItems,
    List<Itemss>? favouriteItems,
    String? search,
  }){

   return FavouriteStates(allItems: allItems?? this.allItems,
    favouriteItems: favouriteItems?? this.favouriteItems,
     search: search?? this.search);
    
  }
}
