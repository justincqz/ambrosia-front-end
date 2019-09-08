import 'package:ambrosia/model/recipe.dart';
import 'dart:convert';
import 'package:http/http.dart';

class AmbrosiaClient extends BaseClient {
  static final String domain = "52.56.77.196";
  static final String pathHead = '/ambrosia';
  Client _inner = Client();

  Future<StreamedResponse> getRequest(String route, Map<String, dynamic> body) {
    Uri uri = new Uri.http(domain, pathHead + route);
    Request request = new Request('get', uri);
    request.body = jsonEncode(body);
    return send(request);
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    request.headers['Content-type'] = 'application/json';
    return _inner.send(request);
  }
}

class RecipeProvider {
  static final String domain = "52.56.77.196/ambrosia/";
  static final String request = "/findrecipe";
  static final AmbrosiaClient client = new AmbrosiaClient();

  Future<Iterable<Recipe>> getRecipes() {
    Future<Iterable<Recipe>> req = client.getRequest(request, new IngredientMock().getJson())
      .then((res) => res.stream.bytesToString()
      .then((str) => Map.of(jsonDecode(str))['recipes']
      .map<Recipe>((json) => Recipe.fromJson(json))));
    return req;
  }
}

class IngredientMock {
  final List<String> ingredients = ['salt', 'miso', 'salmon'];
  Map<String, dynamic> getJson() {
    Map<String, dynamic> json = new Map();
    json['ingredients'] = this.ingredients;
    return json;
  }
}
