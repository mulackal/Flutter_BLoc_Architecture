import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class NewsEvent extends Equatable {}


class FetchNewsEvent extends NewsEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
