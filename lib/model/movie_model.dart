class Movies {
  final String? id;
  final String? ratings;
  final String? thumbnail;
  final String? image;
  final String? title;

  Movies({this.id, this.ratings, this.thumbnail, this.image, this.title});

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
      id: json['Id'],
      title: json['title'],
      image: json['image'],
      ratings: json['Ratings']['imDb'],
      thumbnail: json['thumbnail'],
    );
  }
}
