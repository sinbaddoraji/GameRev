import "package:http/http.dart" as http;
import 'dart:convert' as convert;
import 'gameReviews.dart';

class Game {
  final int id;
  String title;
  String thumbnail;
  String publisher;
  int release_year;
  String description;
  String genre;
  String platforms;
  String username;
  final String post_time;
  final String post_date;

  static String url = 'http://127.0.0.1:8086/api/v1/games';
  

  Game(this.id, this.title, this.thumbnail, this.publisher, this.release_year, this.description, this.genre, this.platforms, this.username, this.post_time, this.post_date);

  Map<String, dynamic> GetJson()
  {
    return <String, dynamic>{
      "id": id,
      "title": title,
      "thumbnail": thumbnail,
      "publisher": publisher,
      "release_year": release_year,
      "description": description,
      "genre": genre,
      "platforms": platforms,
      "username": username,
    };
  }

  static Future<List<Game>> GetAllGames() async
  {
      List<Game> output = []; 
      http.Response response = await http.get(Uri.parse("$url"));
      var games = convert.jsonDecode(response.body)["data"];

      for (var gameData in games) {
        var data = gameData["data"];
        output.add(Game(data["id"], data["title"], data["thumbnail"], data["publisher"], data["release_year"], data["description"], data["genre"], data["platforms"], data["username"], data["post_time"], data["post_date"]));
      }

      return output;
  }

  static Future<Game> GetGame(int id) async {
      http.Response response = await http.get(Uri.parse("$url/$id"));
      var data = convert.jsonDecode(response.body)["data"];

      return Game(data["id"], data["title"], data["thumbnail"], data["publisher"], data["release_year"], data["description"], data["genre"], data["platforms"], data["username"], data["post_time"], data["post_date"]);
  }

  Future<List<GameReview>> GetReviews() async {
      return await GameReview.GetAllGameReviews(this.id);
  }

  Future<GameReview> GetGameReview(int id) async {
      return GameReview.GetGameReview(id, this.id);
  }

  bool Update(String username)
  {
      Map<String, String> headers = {
        'Accept': 'application/json',
        'Content-type': 'application/json'
      };
      if(username == this.username)
      {
          Map<String, dynamic> json = GetJson();

          http.put(Uri.parse("$url/$id"), body: convert.jsonEncode(json), headers: headers);
          print("successfully updated game");
          return true;
      }
      else
      {
          print("user does not have access to this game");
          return false;
      }
  }

  bool Post()
  {
      Map<String, String> headers = {
        'Accept': 'application/json',
        'Content-type': 'application/json'
      };
      try {
        http.post(Uri.parse(url), body: GetJson(), headers: headers);
        return true;
      } catch (e) {
        return false;
      }
  }

  bool Delete(String username, int index)
  {
      if(username == this.username)
      {
          http.delete(Uri.parse("$url/$id"), body: GetJson());
          return true;

      }else return false;
  }
}