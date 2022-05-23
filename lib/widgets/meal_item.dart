
import 'package:cookbook_clone/models/meal.dart';
import 'package:cookbook_clone/screens%20/meal_detail_screen.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;
  MealItem({@required this.id,@required this.title,@required this.imageUrl,@required this.duration,
  @required this.complexity,@required 
  this.affordability,@required this.removeItem});
  
  String get complexityText{
    if(complexity== Complexity.Simple){
      return 'Simple';

    }
    else if(complexity==Complexity.Hard){
      return 'Hard';
    }
    else if(complexity==Complexity.Challenging){
      return 'Challenging';
    }
    else 
    return 'Unknown';
  }
  String get affordabilityText{
    if(affordability==Affordability.Affordable){
      return 'Affordable';

    }
    else if(affordability==Affordability.Luxurious){
      return 'Luxurious';
    }
    else if(affordability==Affordability.Pricey){
      return 'Pricey';
    }
    else 
    return 'Unknown';
  }
  void selectMeal(BuildContext ctx){
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName,
    arguments: id).then((result) {if(result!=null){
      removeItem(result);
    };});
  }
  
  
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: ()=> selectMeal(context),
    child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)
    ),
    elevation: 4,
    margin: EdgeInsets.all(30),
    child: Column(children: <Widget>[
      Stack(children: <Widget>[
        ClipRRect(borderRadius:BorderRadius.only(topLeft:Radius.circular(15),
        topRight:Radius.circular(15),),
        child: Image.network(imageUrl,height: 250,width: double.infinity,fit:BoxFit.cover)
        ,),
        Positioned(
          bottom: 20,
          right: 10,

                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical:5,horizontal:20),
                    child: Text(title,style: TextStyle(fontSize: 26,color: Colors.white,),
          softWrap: true,
          overflow: TextOverflow.fade,
          ),
                  ),
        ) 
        
      ],),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
          Row(children:<Widget>[
            Icon(Icons.schedule,),
            SizedBox(width:6),
            Text('$duration min'),
          ]),
          Row(children:<Widget>[
            Icon(Icons.work,),
            SizedBox(width:6),
            Text(complexityText),
          ]),
          Row(children:<Widget>[
            Icon(Icons.attach_money,),
            SizedBox(width:6),
            Text(affordabilityText),
          ])

        ],),
      )
    ],),
    ),
    );
  }
}