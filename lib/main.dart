import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
void main() async{
  List _data = await getJson();

  runApp(
    new MaterialApp(
      title: "ParsingJson",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('JSON Parse'),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
        ),
        body: new Center(
          child: new ListView.builder(
              itemCount: _data.length,
              itemBuilder: (BuildContext context,int position){
                if(position==0)
                  return new ListTile(
                    title: new Text("${_data[position]['title']}",
                      style: new TextStyle(fontSize: 13.9),),
                    subtitle: new Text("${_data[position]['body']}",
                      style:new TextStyle(
                        fontSize: 13.4,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      ) ,),
                    leading: new CircleAvatar(
                      backgroundColor: Colors.green,
                      child: new Text("${_data[position]['id']}",
                        style: new TextStyle(
                            fontSize: 13.4
                        ),),
                    ),
                    onTap: (){_showOnTapMessage(context, "${_data[position]['title']}");}
                  );
//                  return new Divider();
//                final index = position ~/ 2;

                return new Column(
                  children:<Widget>[
                    new Divider(),
                new ListTile(
                title: new Text("${_data[position]['title']}",
                style: new TextStyle(fontSize: 13.9),),
                subtitle: new Text("${_data[position]['body']}",
                style:new TextStyle(
                fontSize: 13.4,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
                ) ,),
                leading: new CircleAvatar(
                backgroundColor: Colors.green,
                child: new Text("${_data[position]['id']}",
                style: new TextStyle(
                fontSize: 13.4
                ),),
                ),
                onTap: (){_showOnTapMessage(context, "${_data[position]['title']}");},
                ),

                  ]
                );

              },
              padding: const EdgeInsets.all(16.0),
          ) ,
        ),
      ),
    )
  );
}
void _showOnTapMessage(BuildContext context,String message){
  var alert = new AlertDialog(
    title: new Text('App'),
    content: new Text(message),
    actions: <Widget>[
      new FlatButton(onPressed: (){Navigator.pop(context);} , child:new Text('OK')),
    ],
  );
  showDialog(context: context,builder: (context)=>alert);
}


Future<List>getJson() async
{
  String apiUrl = 'https://jsonplaceholder.typicode.com/posts';
  http.Response response = await http.get(apiUrl);

  return json.decode(response.body);
}