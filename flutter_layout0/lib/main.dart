import 'package:flutter/material.dart';

void main() => runApp(Carrot());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          actions: [
            Icon(Icons.abc),
            Icon(Icons.share)
          ],
          title: Text('앱임')
        ),
        body: Center(
          child: Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue)
            ),
            child: IconButton(
              onPressed: (){},
              icon: Icon(Icons.star)
            )
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.phone),
                Icon(Icons.message),
                Icon(Icons.contact_page),
              ],
            ),
          )
        ),
      )
    );
  }
}

class Carrot extends StatelessWidget {
  const Carrot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.all(10),
          height: 150,
          child: Row(
            children: [
              Image.asset('lego.jpeg', width: 150,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('레고 미니피규어 한정판 팝니다', style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700
                  ),),
                  Text('낙성대 행운동', style: TextStyle(
                    fontSize: 10
                  ),),
                  Text('4200 원'),
                  Row(
                    children: [
                      Icon(Icons.favorite)
                    ],
                  )
                ],
              )
            ],
          ),
        )
      )
    );
  }
}

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Row(
          children: [
            Expanded(child: Container(color: Colors.red,)),
            Icon(Icons.star)
          ],
        )
      ),
    );
  }
}
