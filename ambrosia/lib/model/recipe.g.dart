// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map json) {
  return Recipe(
    id: json['id'] as String,
    name: json['name'] as String,
    photo: (json['photo'] as List)?.map((e) => e as String)?.toList(),
    ingredients:
        (json['ingredients'] as List)?.map((e) => e as String)?.toList(),
    steps: (json['steps'] as List)?.map((e) => e as String)?.toList(),
    author: json['author'] as String,
  );
}

Map<String, dynamic> _$RecipeToJson(Recipe instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['name'] = instance.name;
  val['photo'] = instance.photo;
  val['ingredients'] = instance.ingredients;
  val['steps'] = instance.steps;
  val['author'] = instance.author;
  return val;
}
