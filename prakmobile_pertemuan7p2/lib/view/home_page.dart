import 'package:flutter/material.dart';
import 'package:prakmobile_pertemuan7p2/model/kucing.dart';
import 'package:prakmobile_pertemuan7p2/model/recipes_model.dart';
import 'package:prakmobile_pertemuan7p2/view/detail_page.dart';
import 'package:prakmobile_pertemuan7p2/viewmodel/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Recipes? data;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = true;
    getRecipes().then((value) {
      setState(() {
        data = value;
        isLoading = false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:
            const Text('Resep Seafood', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body:  isLoading? Center(child: CircularProgressIndicator()) : ListView.builder(
          itemCount: data!.meals.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailPage(id: data!.meals[index].idMeal)));
                  },
                  child: Card(
                    elevation: 5,
                    child: Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 160,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image:  NetworkImage(data!.meals[index].strMealThumb),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                              data!.meals[index].strMeal,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}
