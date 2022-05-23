import 'package:cookbook_clone/models/meal.dart';
import 'package:cookbook_clone/widgets/meal_item.dart';

import '../dummy_data.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName='/category-meals';
  final List<Meal>availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData=false;
  
  @override
  void initState() {
    // TODO: implement initState
   
    
  super.initState();
  }
  @override
  void didChangeDependencies() {
    if(true!=_loadedInitData)
    {final routeArgs=ModalRoute.of(context).settings.arguments as Map<String,String>;
    categoryTitle  =routeArgs['title'];
    final categoryId =routeArgs['id'];
    displayedMeals  =DUMMY_MEALS.where((meal){
      return meal.categories.contains(categoryId);
    } ).toList();
    _loadedInitData=true;}
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void _removeMeal(String melaId){
    setState(() {
      displayedMeals.removeWhere((meal) =>meal.id==melaId );
    });
  
  }
  @override

  Widget build(BuildContext context) {
    

    return Scaffold(appBar:AppBar(title: Text(categoryTitle),),
    body: ListView.builder(itemBuilder: (ctx,i){
    return MealItem(id:displayedMeals[i].id,title: displayedMeals[i].title,
     imageUrl: displayedMeals[i].imageUrl,
     duration: displayedMeals[i].duration, complexity: displayedMeals[i].complexity, 
     affordability: displayedMeals[i].affordability,removeItem: _removeMeal,);
    },itemCount:displayedMeals.length,));
  }
}