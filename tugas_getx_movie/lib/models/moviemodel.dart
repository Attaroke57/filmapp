class Movie {
  final String title;
  final String imageUrl;
  final String genre;
  final String age;
  final String director; 
   final double rating;

  Movie({
    required this.title,
    required this.imageUrl,
    this.genre = '',
    this.age = '',
    this.director = '' ,
   this.rating = 0.0,
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'] as String,
      imageUrl: map['imageUrl'] as String,
      genre: map['genre'] ?? '',
      age: map['age'] ?? '',
      director: map['director'] ?? '',
      rating: (map['rating'] as num?)?.toDouble() ?? 0.0, 
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'imageUrl': imageUrl,
      'genre': genre,
      'age': age,
      'director': director,
      'rating' : rating 
    };
  }
}
