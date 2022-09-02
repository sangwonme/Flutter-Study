import 'dart:convert';

import 'package:api_mvvm_tutorial/model/store.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Store> stores = [];
  var isLoading = false;

  Future fetch() async{
    setState((){
      isLoading = true;
    });

    var url = Uri.https('gist.githubusercontent.com','junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json');
    var response = await http.get(url);

    final jsonResult = jsonDecode(response.body);
    final jsonStores = jsonResult['stores'];

    setState((){
      stores = [];
      jsonStores.forEach((e){
        stores.add(Store.fromJson(e));
      });
      isLoading = false;
    });

    print('fetch done!');

  }

  @override
  void initState(){
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('마스크 재고 있는 곳 : ${stores.length} 곳'),
        actions: [
          IconButton(
            onPressed: (){
              fetch();
            },
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: isLoading == true ? loadingWidget() : ListView(
        children: stores.map((e){
          return ListTile(
            title: Text(e.name ?? '이름 없는 약국'),
            subtitle: Text(e.addr ?? '주소 없는 약국'),
            trailing: _buildRemainState(e),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildRemainState(Store store){
    var stat = '판매 중지';
    var desc = '판매 중지';
    var color = Colors.black;
    switch(store.remainStat){
      case 'plenty':
        stat = '충분';
        desc = '100개 이상';
        color = Colors.green;
        break;
      case 'some':
        stat = '보통';
        desc = '30개 이상';
        color = Colors.orange;
        break;
      case 'few':
        stat = '부족';
        desc = '2개 이상';
        color = Colors.red;
        break;
      case 'empty':
        stat = '판매 중지';
        desc = '판매 중지';
        color = Colors.black;
        break;
    }

    return Column(
      children: [
        Text(stat, style: TextStyle(fontWeight: FontWeight.w800, color: color)),
        Text(desc, style: TextStyle(color: color))
      ],
    );
  }

  Widget loadingWidget(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const[
          Text('약국 정보를 불러오는 중'),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}
