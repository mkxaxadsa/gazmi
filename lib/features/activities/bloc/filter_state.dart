part of 'filter_bloc.dart';

abstract class FilterState {}

final class FilterIntial extends FilterState {}

final class FilterDataState extends FilterState {
  List<List<double>> data;
  int? weekday;
  FilterDataState(this.data, {this.weekday});
}
