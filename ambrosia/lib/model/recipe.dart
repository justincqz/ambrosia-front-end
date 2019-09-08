import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

@JsonSerializable(anyMap: true)
class Recipe {
  @JsonKey(includeIfNull: false, nullable: true)
  final String id;
  final String name;
  final List<String> photo;
  final List<String> ingredients;
  final List<String> steps;
  final String author;

  Recipe(
  {
    this.id,
    this.name,
    this.photo = const [],
    this.ingredients = const [],
    this.steps = const [],
    this.author,
  });

  static Recipe parseRecipe(Map json) {
    var recipe = _$RecipeFromJson(json);
    recipe._initialisePhotoList();
    recipe._initialiseStepList();
    return recipe;
  }

  factory Recipe.fromJson(Map<String, dynamic> json) => parseRecipe(json);

  String toString() {
    return 'Recipe ' + this.name + ' by ' + this.author;
  }

  void _initialisePhotoList() {
    RegExp imageRegex = new RegExp(
      r"(?:http|https)\:\/\/\S+\.jpg",
      caseSensitive: false,
      multiLine: false,
    );

    // Strips quote marks and weird multiplier text (x3)
    var photos = imageRegex.allMatches(this.photo.first)
      .map((match) => match.group(0));

    this.photo.clear();
    this.photo.addAll(photos);
  }

  void _initialiseStepList() {
    RegExp stepRegex = new RegExp(
      r"(\')([^\']+)(\')",
      caseSensitive: false,
      multiLine: false,
    );

    // Gets the instructions in between of the quotes (')
    var steps = stepRegex.allMatches(this.steps.first)
      .map((match) => match.group(2));

    this.steps.clear();
    this.steps.addAll(steps);
  }

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
