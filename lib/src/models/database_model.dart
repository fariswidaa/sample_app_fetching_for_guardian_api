class News {
  int id ;
  String description ;
  String image ;
  
  News({this.description, this.id, this.image});

  factory News.fromDatabaseMap(Map<String, dynamic> json) => new News(
    id : json["id"],
    description: json["description"],
    image: json["image"] ,
  );

  Map<String, dynamic> toDatabaseMap() => {
    "id": id,
    "description": description,
    "image": image ,
  };

}
