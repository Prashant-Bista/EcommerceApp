class HomePageModel {
  int selectedIndex;
List<dynamic>? products;
  HomePageModel({this.selectedIndex = 0,this.products});

  factory HomePageModel.initial(){
    return HomePageModel(
        selectedIndex: 0,
      products: []
    );
  }

   HomePageModel copyWith({int? selectedIndex,List<dynamic>? products}){
    return HomePageModel(
      selectedIndex: selectedIndex ?? 0,
      products: products??[]
    );
  }
}