part of 'filter_bloc.dart';

abstract class FilterEvent {}

class FilterDataEvent extends FilterEvent {
  String type;

  FilterDataEvent(this.type);
}
