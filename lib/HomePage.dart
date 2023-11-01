
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool likesun = false;
  int likevalu = 0;
  Color? color;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Card(
            child: Container(
              child: Column(
                children: [

                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal:16),
                         child: Text("Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"),
                       ),
                         
                  Container(
                    height:70,
                    color:Color.fromARGB(255, 218, 217, 217),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              
                              IconButton(onPressed: () {
                               
                                setState(() {
                                 

                                  likesun=!likesun;

                                  likesun? likevalu+=1:likevalu-=1;
                                   adddata();
                                });
                              },icon: likesun?Icon(Icons.favorite,color: Colors.pink,):Icon(Icons.favorite_border) ),

                              
                            ],
                          )
                        ),
                           Expanded(
                          child: IconButton(onPressed: () {
                            showModalBottomSheet(context: context, builder:(context) =>Container(child:Text("sakib"),),);
                          }, icon:Icon(Icons.access_alarm_outlined,color:color,)),
                           )
                      ],
                    ),
                  )
                ],
              ),

            ),
          )
        ],
      ),
    );
  }
   
   Future<void>adddata()async{
    var colaction= await FirebaseFirestore.instance.collection("add_like");
      
    var likemap ={
        "like":likevalu,
      };

      colaction.add(likemap);
   }



 
  
}