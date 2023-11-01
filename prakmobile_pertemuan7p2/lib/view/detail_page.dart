import 'package:flutter/material.dart';
import 'package:prakmobile_pertemuan7p2/model/kucing.dart';
import 'package:prakmobile_pertemuan7p2/model/recipedetail.dart';

import '../viewmodel/services.dart';

class DetailPage extends StatefulWidget {
  final String id;

  const DetailPage({super.key, required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  RecipeDetail? data;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = true;
    getRecipeDetail(widget.id).then((value) {
      setState(() {
        data = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(data!.meals[0].strMeal, style: TextStyle(color: Colors.white)),
      ),
      body:  isLoading? Center(child: CircularProgressIndicator()) : ListView(
        padding: const EdgeInsets.only(top: 0),
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              image: DecorationImage(
                  image: NetworkImage(data!.meals[0].strMealThumb), fit: BoxFit.cover),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(data!.meals[0].strMeal,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(
                      data!.meals[0].strCategory,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    data!.meals[0].strInstructions,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
