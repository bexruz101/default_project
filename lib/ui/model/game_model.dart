class GameModel {
  final int id;
  final String title;
  final String thumbail;
  final String shortDescription;
  final String gameUrl;
  final String genre;
  final String platform;
  final String publisher;
  final String developer;
  final String releaseDate;
  final String freetogameProfileUrl;

  GameModel({
    required this.id,
    required this.title,
    required this.developer,
    required this.freetogameProfileUrl,
    required this.gameUrl,
    required this.genre,
    required this.platform,
    required this.publisher,
    required this.releaseDate,
    required this.shortDescription,
    required this.thumbail
  });

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
        id: json['id'] as int ?? 0,
        title:json['title']   as String? ?? "",
        developer: json['developer']  as String? ?? "",
        freetogameProfileUrl: json['freetogame_profile_url']  as String? ?? "",
        gameUrl: json['game_url']  as String? ?? "",
        genre: json['genre']  as String? ?? "",
        platform: json['platform']  as String? ?? "",
        publisher: json['publisher']  as String? ?? "",
        releaseDate: json['release_date'] as String? ?? "" ,
        shortDescription: json['short_description'] as String? ?? "",
        thumbail: json['thumbnail'] as String? ?? "") ;
  }
}
