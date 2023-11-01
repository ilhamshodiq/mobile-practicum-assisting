
import 'package:dio/dio.dart';
import 'package:prakmobile_pertemuan7p2/model/recipes_model.dart';

import '../model/recipedetail.dart';

Future<Recipes> getRecipes() async {
  Response response = await Dio().get('https://www.themealdb.com/api/json/v1/1/filter.php?c=Vegetarian');
  String data = response.toString();
  print(data);//untuk logging
  return recipesFromJson(data);
}

Future<RecipeDetail> getRecipeDetail(String id) async {
  Response response = await Dio().get('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id');
  String data = response.toString();
  print(data);//untuk logging
  return recipeDetailFromJson(data);
}