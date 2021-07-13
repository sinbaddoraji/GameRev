import "package:http/http.dart" as http;
import 'dart:convert' as convert;

class Account
{
    final int id;
    final String user;
    final String pass;
    final String email;
    final String first_name;
    final String last_name;
    final String country;

    static String url = "http://192.168.1.216:8086/accounts";

    Account(this.id, this.user, this.pass, this.email, this.first_name, this.last_name, this.country);

    static Account account = Account(-1, "user", "pass", "email", "first_name", "last_name", "country");

    static Future<Account> Login(String user, String pass) async {
        var tokenBytes = convert.utf8.encode("$user:$pass");
        String token = convert.base64Encode(tokenBytes);

        Map<String, String> headers = {
          'Accept': 'application/json',
          'Content-type': 'application/json',
          'Authorization' : 'Basic $token'
        };

        http.Response response = await http.get(Uri.parse(url), headers:headers);
        var data = convert.jsonDecode(response.body)["data"][0];
        print(data["id"]);

        return Account(data["id"], data["user"], "",data["email"],data["first_name"],data["last_name"],data["country"]);
    }

    Future<bool> Register() async
    {
      var data = convert.jsonEncode(<String, dynamic>{
        "id": this.id,
        "user": this.user,
        "pass": pass,
        "email": email,
        "first_name": first_name,
        "last_name": country
      });

      Map<String, String> headers = {
        'Accept': 'application/json',
        'Content-type': 'application/json'
      };

      http.Response response = await http.post(Uri.parse(url), headers:headers, body:data);
      var dataResponse = convert.jsonDecode(response.body)["status"];

      return dataResponse == "success";
    }
}