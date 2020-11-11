import 'package:beautysquare/base/base_page.dart';
import 'package:beautysquare/block/news/news_bloc.dart';
import 'package:beautysquare/block/news/news_event.dart';
import 'package:beautysquare/block/news/news_state.dart';
import 'package:beautysquare/model/employee_responds.dart';
import 'package:beautysquare/util/shared_Preference_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'news_detailspage.dart';


class NewsPage extends BasePage {
  static const routeName = '/news';
  @override
  _NewsPageState createState() => new _NewsPageState();
}

class _NewsPageState extends BasePageState<NewsPage> {

  NewsBloc _newsBloc;

  final GlobalKey<ScaffoldState> _scaffold = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _newsBloc = NewsBloc();
    _newsBloc.add(FetchNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffold,
        appBar: AppBar(
          elevation: defaultTargetPlatform == TargetPlatform.iOS ? 0.0 : 5.0,
          title: Text("Employees"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _newsBloc.add(FetchNewsEvent());
              },
            ),
            IconButton(
              icon: Icon(Icons.arrow_upward),
              onPressed: () {
                SharedPreferenceManager().setLogin(false);
                SystemNavigator.pop();
              },
            ),
          ],

        ),

      body: Container(
      child: BlocBuilder(
        bloc: _newsBloc,
        builder: (BuildContext context, NewsState state) {
          if (state is NewsInitialState) {
            return buildErrorUi("No data fount");
          } else if (state is NewsLoadingState) {
            showLoadingDialoge();
          } else if (state is NewsLoadedState) {
            hideLoadingDialoge();
            if(state.News!=null && state.News.length > 0)
            return _feedBackWidget(state.News);
            else
              return buildErrorUi("No data");
          } else if (state is NewsErrorState) {
            hideLoadingDialoge();
            return buildErrorUi(state.message);
          }
          return buildErrorUi("No data fount");
        },
      ),
    ));
  }

  Widget buildErrorUi(String message) {
    return RefreshIndicator(
      onRefresh: () async {
        _newsBloc.add(FetchNewsEvent());
      },
        child: ListView(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: Center(child: Text(
                  message,
                  style: TextStyle(color: Colors.red),
                ),),
              ),
            ],
          ),
        );
  }

  Widget _feedBackWidget(List<Data> data) {
    return RefreshIndicator(
       // onRefresh: () {_newsBloc.add(FetchNewsEvent());},
      onRefresh: () async {
         _newsBloc.add(FetchNewsEvent());
         //return Future.delayed(Duration(seconds: 2));
      },
      child: Container(
      child: new Padding(
        padding: EdgeInsets.all(8.0),
        child: new Column(
          children: <Widget>[
            new Flexible(
              child: new ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  final Data _homedata = data[index];
                  return _getCardItemUi(context, _homedata);
                },
              ),
            )
          ],
        ),
      ),
    ),
    );
  }


  Widget _getCardItemUi(BuildContext context, Data _homedata) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new ListTile(
            title: new Padding(
              padding: EdgeInsets.only(top: 5.0),
              child:  Hero(
                tag: _homedata.id,
                 child: Text(
                _homedata.employeeName,
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orangeAccent,
                  fontSize: 18.0,
                ),
              ),
    ),
            ),

            subtitle: new Padding(
                padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                child: new Text(
                      "Salary: " + _homedata.employeeSalary.toString(),
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                )),
            trailing:  new Padding(
                padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                child: new Text(
                  _homedata.employeeAge.toString(),
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.green,
                  ),
                )),

            onTap: () {
              if(_homedata!=null)
                navigateToArticleDetailPage(context,_homedata);
            },
          )
        ],
      ),
    );
  }


  void navigateToArticleDetailPage(BuildContext context, Data data) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NewsDetailPage(
        news: data,
      );
    }));
  }

  void _popUpBack() {
    Navigator.pop(context, 'ReLogin');
  }

  @override
  void dispose() {
    //_newsBloc.dispose();
    super.dispose();
  }

}


