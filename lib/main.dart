import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:raj/Model/model.dart';
void main()
{
  runApp(MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home:Photo('Photos')


  ));

}

class Photo extends StatefulWidget {
final String title;
Photo(this.title);
  @override
  _PhotoState createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata().then((data){
     print(data);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title}'),centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh), onPressed: (){
        //print(Task(id:1,title: 'task1',status: true).id);
        setState(() {

        });
      
      }),
      body:
          FutureBuilder(future:getdata() ,builder: (context,snapshot){
            if(snapshot.hasData)
              {
                return Image.network(snapshot.data);
              }
            else
              {

                return Center(child: CircularProgressIndicator());
              }

          })
        //Image.network('https://www.google.com/imgres?imgurl=https%3A%2F%2Fenglish.mathrubhumi.com%2Fpolopoly_fs%2F1.1971679.1495950022!%2Fimage%2Fimage.jpg_gen%2Fderivatives%2Flandscape_728_450%2Fimage.jpg&imgrefurl=https%3A%2F%2Fenglish.mathrubhumi.com%2Fsports%2Fcricket%2Fyuvi-not-part-of-top-74-players-as-selectors-name-bp-xi-squad-1.2220081&docid=pQmGttoPwl067M&tbnid=XivC6oEdrsuyFM%3A&vet=10ahUKEwj3qJ_0zrDfAhVFp48KHbDkB8kQMwgzKAAwAA..i&w=728&h=546&bih=625&biw=1022&q=yuvi&ved=0ahUKEwj3qJ_0zrDfAhVFp48KHbDkB8kQMwgzKAAwAA&iact=mrc&uact=8'),
    );
  }
  Future<String>getdata() async {
    String url = 'https://api.unsplash.com/photos/random/?client_id=c2d213c7d3528998d85929ccf6be60418da803cb0f10c498cb050135c97d47d2';
    //Map<String> response = {'img': []};
    String abc;
    var res = await http.get(url).then((data) {
      if (data.statusCode == 200) {

      //  for (int i = 0; i < abc.length; i++) {
          //Photo p = Photo.fromJson(abc[i]);
           abc= json.decode(data.body)['urls']['full'];
          print(abc);
        }
       // List parsedata = json.decode(data.body);
        print('this is${data.body}');

    });
    return abc;
  }

}



