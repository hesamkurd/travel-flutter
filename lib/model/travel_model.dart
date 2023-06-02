class TravelModel {
  String name;
  String location;
  String price;
  String temp;
  String distance;
  String description;
  String img;
  String rating;

  TravelModel({
    required this.name,
    required this.location,
    required this.price,
    required this.temp,
    required this.distance,
    required this.description,
    required this.img,
    required this.rating,
  });
}

List<TravelModel> travelList = [
  TravelModel(
      name: "Awyar",
      location: "Sine - Kurdistan",
      price: "7000",
      temp: "27",
      distance: "215",
      description: "dsecription",
      img: "assets/images/1.webp",
      rating: "4.9"),
  TravelModel(
      name: "Arbaba",
      location: "bane - Kurdistan",
      price: "6500",
      temp: "26",
      distance: "125",
      description: "dsecription",
      img: "assets/images/2.jpg",
      rating: "4.5"),
  TravelModel(
      name: "shalmash",
      location: "Serdasht - Kurdistan",
      price: "6400",
      temp: "25",
      distance: "143",
      description: "dsecription",
      img: "assets/images/3.jpg",
      rating: "4.6"),
  TravelModel(
      name: "rejaw",
      location: "serpel - Kurdistan",
      price: "7200",
      temp: "27",
      distance: "234",
      description: "dsecription",
      img: "assets/images/4.jpg",
      rating: "4.8"),
];
