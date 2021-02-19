import 'package:flutter/material.dart';

class SubDetail extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SubDetail();
  }

}

class _SubDetail extends State<SubDetail>{

  List<String> todoList = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todoList.add('당근 사오기');
    todoList.add('약 사오기');
    todoList.add('청소하기');
    todoList.add('부모님께 전화하기');
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Sub Detail Example'),
      ),
      body: ListView.builder(itemBuilder: (context,index){
        return Card(
          child: InkWell(
            child: Text(
              todoList[index],
              style: TextStyle(fontSize: 30),
            ),
            onTap: (){
              //arguments: 인자(데이터)전달
              Navigator.of(context).pushNamed('/third',arguments: todoList[index]);
            },
          ),
        );
      },itemCount: todoList.length),
        floatingActionButton: FloatingActionButton(
        onPressed: (){
          _addNaigation(context);
        },
    child: Icon(Icons.add),
    ),
    );
  }

  void _addNaigation(BuildContext context) async{

    final res= await Navigator.of(context).pushNamed('/second');
    setState(() {
      todoList.add(res);
    });

  }
}