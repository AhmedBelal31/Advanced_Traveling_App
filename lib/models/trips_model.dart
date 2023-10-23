class TripDetailsModel {
  int? id;

  int? stars;

  int? people;

  int? selectedPeople;

  int? price;

  String? name;

  String? description;

  String? img;

  String? location;

  TripDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stars = json['stars'];
    people = json['people'];
    selectedPeople = json['selected_people'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    img = json['img'];
    location = json['location'];
  }
}
