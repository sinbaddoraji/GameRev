import "package:http/http.dart" as http;
import 'dart:convert' as convert;
import 'game.dart';
class GameReview {
  int id;
  int game_id;
  double rating;
  String review;
  String username;
  final String review_time;
  final String review_date;

  static String url = 'http://127.0.0.1:8086/api/v1/games';

  GameReview(this.id, this.game_id, this.rating, this.review, this.username, this.review_time, this.review_date);

  Map<String, dynamic> GetJson()
  {
    return {
      "id": id,
      "game_id": game_id,
      "rating": rating,
      "review": review,
      "username": username,
      "review_time": review_time,
      "review_date": review_date
    };
  }

static Future<List<GameReview>> GetAllGameReviews(int game_id) async
  {
      List<GameReview> output = []; 
      http.Response response = await http.get(Uri.parse("${Game.url}/$game_id/reviews"));
      var games = convert.jsonDecode(response.body)["data"];

      for (var gameData in games) {
        var data = gameData["data"];
        output.add(GameReview(data["id"], data["game_id"], data["rating"], data["review"], data["username"], data["review_time"], data["review_date"]));
      }

      return output;
  }

  static Future<GameReview> GetGameReview(int game_id, int id) async {
      http.Response response = await http.get(Uri.parse("${Game.url}/$game_id/reviews"));
      var data = convert.jsonDecode(response.body)["data"];

      return GameReview(data["id"], data["game_id"], data["rating"], data["review"], data["username"], data["review_time"], data["review_date"]);
  }

  bool Update(String username)
  {
    Map<String, String> headers = {
        'Accept': 'application/json',
        'Content-type': 'application/json'
      };
      if(username == this.username)
      {
          http.put(Uri.parse("${Game.url}/$game_id/reviews"), body: convert.jsonEncode(GetJson()), headers: headers);
          return true;

      }else return false;
  }

  bool Post()
  {
    Map<String, String> headers = {
        'Accept': 'application/json',
        'Content-type': 'application/json'
      };
      try {
        http.post(Uri.parse("${Game.url}/$game_id/reviews"), body: convert.jsonEncode(GetJson()), headers: headers);
        return true;
      } catch (e) {
        return false;
      }
  }

  bool Delete(String username, int index)
  {
      if(username == this.username)
      {
          http.delete(Uri.parse("${Game.url}/$game_id/reviews"));
          return true;

      }else return false;
  }
}