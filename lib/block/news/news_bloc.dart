import 'dart:async';
import 'dart:math';
import 'package:beautysquare/model/employee_responds.dart';
import 'package:beautysquare/repository/app_repository.dart';
import 'package:beautysquare/util/data_injector.dart';
import 'package:bloc/bloc.dart';

import 'news_event.dart';
import 'news_state.dart';


class NewsBloc extends Bloc<NewsEvent, NewsState> {

  AppRepository _repository;

  NewsBloc() {
    _repository = new Injector().myRepository;
  }

  @override
  NewsState get initialState => NewsInitialState();

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is FetchNewsEvent) {
      yield NewsLoadingState();
      try {
        List<Data> articles = await _repository.getNewsList();
        yield NewsLoadedState(News: articles);
      } catch (e) {
        yield NewsErrorState(message: e.toString());
      }
    }
  }

}
