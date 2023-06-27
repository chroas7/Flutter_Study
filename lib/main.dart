import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: MyApp()
     )
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var a = 1;
  var name = ['김영숙', '홍길동', '피자집'];

  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (c, i) {
            return ListTile(
               title: Text(name[i]),
            );
      }),

      floatingActionButton: FloatingActionButton(
        child: Text(a.toString()),
        onPressed: () {
          showDialog(context: context, builder: (context) {
            return DialogUI();
          });
        },
      ),
    );
  }
}

class DialogUI extends StatelessWidget {
  const DialogUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: SizedBox(
          width: 300,
          height: 300,
          child:
            Column(
                children: [
                TextField(),
                TextButton(onPressed: (){}, child: Text('완료')),
                TextButton(
                  child: Text('취소'),
                  onPressed: (){Navigator.pop(context); })
                ],
          ),
    ));
  }
}
