import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> post = [];

  @override
  Widget build(BuildContext context) {
    return
      FutureBuilder(
        future: getData(),
        builder: (context,snapshot) {
          if(snapshot.hasData){
            return  ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index){
                return Container(
                  height: 120,
                  color: Colors.deepOrange,
                  padding: EdgeInsets.symmetric(vertical: 18,horizontal: 10),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('User id: ${post[index].userId}',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text('Id: ${post[index].id}',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text('Title: ${post[index].title}',
                        maxLines: 1,
                        style: TextStyle(fontSize: 15),
                      ),
                      Text('Body: ${post[index].body}',
                        maxLines: 1,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
    //         ListView.builder(
    //       itemCount: 10,
    //       itemBuilder: (context, index){
    //         return Container(
    //           height: 120,
    //           color: Colors.deepOrange,
    //           padding: EdgeInsets.symmetric(vertical: 18,horizontal: 10),
    //           margin: EdgeInsets.all(10),
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text('User id: data', style: TextStyle(fontSize: 15),
    //               ),
    //               Text('Id: data', style: TextStyle(fontSize: 15),
    //               ),
    //               Text('Title: data', style: TextStyle(fontSize: 15),
    //               ),
    //               Text('Body: data', style: TextStyle(fontSize: 15),
    //               ),
    //             ],
    //           ),
    //         );
    //       },
    // );
        }
      );
  }

  Future<List<Post>> getData() async{
    final respose= await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(respose.body.toString());

    if(respose.statusCode == 200){
      for(Map<String, dynamic> index in data){
        post.add(Post.fromJson(index));
      }
      return post;
    }else{
      return post;
    }
  }

}
