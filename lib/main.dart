import 'dart:math';
import 'package:flutter/cupertino.dart';

import 'insta.dart';
import 'package:flutter/material.dart';


void main() {
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // callback method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instafriend',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      home: Test(),
    );
  }
}

class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key);


  final List<Insta> InstaList = [
    Insta(imguser: 'assets/images/peachys.png', img: 'assets/images/peachys.png',
        userpost: 'Peachys', comments: [Comments(user: 'PACK', comment: "So cute 😍😍😍"),Comments(user: 'POOH', comment: 'Love you all my babe❤')],
        caption: "Wonderful💚💚💚💚💚💚💚💚 \n #Candy"),
    Insta(imguser: 'assets/images/pooh1.png', img: 'assets/images/pooh2.png',
        userpost: 'POOH',comments: [Comments(user: 'Peachys', comment: 'So cute my babe💚'),Comments(user: 'Print', comment: 'Wowww')],
        caption: 'I am shy.'),
    Insta(imguser: 'assets/images/amber.png', img: 'assets/images/Bear.png',
        userpost: 'Amber',comments: [Comments(user: 'Peachys', comment: 'Cute💙'),Comments(user: 'Nadia', comment: 'Sweetie')],
        caption: 'bear love ☺☺'),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade100,
      appBar: AppBar(title: Text('Instafriend',
          style: TextStyle(fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,))),
      body: ListView.builder(
          itemCount: InstaList.length,
          itemBuilder: (context, index) =>
              MyCard(insta: InstaList[index])),

    );
  }
}
class MyCard extends StatefulWidget {
  final Insta insta;

  const MyCard({
    Key? key,
    required this.insta,
  }) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final controller = TextEditingController();
  var like = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Text(covid.date),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage('${widget.insta.imguser}'),
                ),
                SizedBox(width: 10.0),
                Expanded(
                    child: Text(
                        '${widget.insta.userpost}'
                    )
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.more_vert),)
              ],
            ),
          ),
          Image.asset('${widget.insta.img}',fit: BoxFit.cover,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                /*SizedBox(width: 5.0),*/
                Expanded(
                    child: Text(
                        '${widget.insta.caption}'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0,left: 16.0,right: 16.0),
            child: Column(
              children: [
                for(int i=0;i<widget.insta.comments.length;i++)
                  Row(
                    children: [
                      SizedBox(height: 23.0,),
                      Text(
                        '${widget.insta.comments[i].user}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.pink.shade400,
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(width: 5.0,),
                      Text(
                        '${widget.insta.comments[i].comment}',
                        style: TextStyle(

                        ),
                      )
                    ],
                  ),
              ],
            ),
          ),


          Row(
            children: [
              IconButton(onPressed: (){
                setState(() {
                  like = !like;
                });
              }, icon: like? Icon(Icons.favorite,color: Colors.redAccent,): Icon(Icons.favorite_border),),
              Expanded(
                child: TextField(
                  onSubmitted: (value){

                    setState(() {
                      widget.insta.comments.add(Comments(user: 'Flutter', comment: value));
                      controller.clear();

                    });
                  },
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Add a comment',
                  ),
                ),
              ),
            ],
          )


        ],
      ),
    );
  }
}