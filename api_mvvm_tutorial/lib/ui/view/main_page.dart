import 'package:api_mvvm_tutorial/ui/widget/remain_stat_list_tile.dart';
import 'package:api_mvvm_tutorial/viewmodel/store_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final storeModel = Provider.of<StoreModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('마스크 재고 있는 곳 : ${storeModel.stores.length} 곳'),
        actions: [
          IconButton(
            onPressed: (){
              storeModel.fetch();
            },
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: storeModel.isLoading == true ? loadingWidget() : ListView(
        children: storeModel.stores.map((e){
          return ListTile(
            title: Text(e.name ?? '이름 없는 약국'),
            subtitle: Text(e.addr ?? '주소 없는 약국'),
            trailing: RemainStatListTile(e),
          );
        }).toList(),
      ),
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