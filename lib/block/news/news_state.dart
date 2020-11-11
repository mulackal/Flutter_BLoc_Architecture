import 'package:beautysquare/model/employee_responds.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class NewsState extends Equatable {}

class NewsInitialState extends NewsState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class NewsLoadingState extends NewsState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class NewsLoadedState extends NewsState {

  List<Data> News;

  NewsLoadedState({@required this.News});

  @override
  // TODO: implement props
  List<Object> get props => [News];
}

class NewsErrorState extends NewsState {

  String message;

  NewsErrorState({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}