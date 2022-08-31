import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memomemo/screens/edit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        physics: PageScrollPhysics (),
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                child: Text('메모메모',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 36
                  ),
                ),
              )
            ],
          ),
          ...LoadMemo()
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => EditPage())
          );
        },
        tooltip: '메모를 추가하려면 클릭하세요',
        label: Text('메모 추가'),
        icon: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<Widget> LoadMemo() {
    List<Widget> memoList = [];
    memoList.add(Container(color: Colors.red, height: 70,));
    memoList.add(Container(color: Colors.blueGrey, height: 70,));
    return memoList;
  }
}
