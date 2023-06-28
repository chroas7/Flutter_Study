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
  var total = 3;
  var name = ['김영숙', '홍길동', '피자집'];
  var like = [0, 0, 0];

  addOne(){
    setState(() {
      total++;
    });
  }

  addContact(newName)
  {
    setState(() {
      name.add(newName);
    });
  }

  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(title: Text(total.toString()), ),
      body: ListView.builder(
          itemCount: name.length,
          itemBuilder: (c, i) {
            return ListTile(
               title: Text(name[i]),
            );
      }),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) {
            return DialogUI(addOne: addOne, addContact: addContact);
          });
        },
      ),
    );
  }
}

class DialogUI extends StatelessWidget {
  DialogUI({Key? key, this.addOne, this.addContact}) : super(key: key);
  final addOne;
  final addContact;
  var inputData = TextEditingController();
  // var inputData2 = '';
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: SizedBox(
          width: 300,
          height: 300,
          child:
            Column(
                children: [
                TextField(controller: inputData,),
                TextButton(
                  child: Text('완료'), onPressed: () {
                  addContact(inputData.text);
                  Navigator.pop(context);
                },
                ),
                TextButton(
                  child: Text('취소'),
                  onPressed: (){Navigator.pop(context); })
                ],
          ),
    ));
  }
}
