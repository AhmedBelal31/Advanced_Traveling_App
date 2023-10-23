class ExploreItemModel
{
  final String image ;
  final String text ;

  ExploreItemModel({required this.image,required  this.text});

}
List<ExploreItemModel> exploreItems = [

  ExploreItemModel(image: 'assets/images/kayaking.png', text: 'Kayoking'),
  ExploreItemModel(image: 'assets/images/snorkling.png', text: 'Snorkling'),
  ExploreItemModel(image: 'assets/images/balloning.png', text:'Balloning' ),
  ExploreItemModel(image: 'assets/images/hiking.png', text:'Hiking' ),
];