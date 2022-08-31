import 'package:flutter/material.dart';
import 'package:memomemo/database/db.dart';
import 'package:memomemo/database/memo.dart';

class EditPage extends StatelessWidget {
  EditPage({Key? key}) : super(key: key);

  String title = '';
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.delete)
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.save)
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (String title){this.title = title;},
              // obscureText: true,
              style: TextStyle(
                fontSize: 20
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                // border: OutlineInputBorder(),
                hintText: '제목을 적어주세요.'
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            TextField(
              onChanged: (String text){this.text = text;},
              // obscureText: true,
              decoration: InputDecoration(
                // border: OutlineInputBorder(),
                  hintText: '메모의 내용을 적어주세요.'
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            )
          ],
        ),
      ),
    );
  }

  Future<void> saveDB() async{
    DBHelper sd = DBHelper();

    var fido = Memo(
        id: 3,
        title: this.title,
        text: this.text,
        createTime: DateTime.now().toString(),
        editTime: DateTime.now().toString()
    );

    await sd.insertMemo(fido);

    print(await sd.memos());
  }
}
