import 'package:flutter/material.dart';
import 'package:api_mvvm_tutorial/model/store.dart';

class RemainStatListTile extends StatelessWidget {
  final Store store;

  RemainStatListTile(this.store);

  @override
  Widget build(BuildContext context) {
    return _buildRemainState(store);
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
}
