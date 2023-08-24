import 'package:flutter/material.dart';
import 'package:getmethod/homepage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'API Example',
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   List<dynamic> _posts = [];
//
//   Future<void> _fetchData() async {
//     //final response = await http.get(Uri.parse('https://app.quicktype.io/posts'));
//     final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
//
//     if (response.statusCode == 200) {
//       setState(() {
//         _posts = json.decode(response.body);
//       });
//     } else {
//       throw Exception('Failed to fetch data');
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('API Example'),
//       ),
//       body: _posts.isEmpty
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//         itemCount: _posts.length,
//         itemBuilder: (context, index) {
//           final post = _posts[index];
//           return ListTile(
//             title: Text(post['title']),
//             subtitle: Text(post['body']),
//           );
//         },
//       ),
//     );
//   }
// }
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: HomePage(),
      ),
    );
  }
}
