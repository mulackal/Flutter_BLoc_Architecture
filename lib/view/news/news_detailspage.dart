
import 'package:beautysquare/model/employee_responds.dart';
import 'package:flutter/material.dart';

class NewsDetailPage extends StatelessWidget {
  Data news;

  NewsDetailPage({this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: ListView(
        padding: EdgeInsets.all(5.0),
        children: <Widget>[
          Hero(
            tag: news.id,
            child:Text(
              "My Details Here!",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.0),
            child: Text(
              news.employeeName,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.all(5.0),
            child: Text("Age: ${news.employeeAge}"),
          ),
          Text("Salary: ${news.employeeSalary}"),
        ],
      ),
    );
  }
}