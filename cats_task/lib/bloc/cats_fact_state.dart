import '../domains/data_model/cats_fact_model.dart';

class CatsFactState{}

class CatsFactEmptyState extends CatsFactState{}

class HistoryDataState extends CatsFactState{
  final Iterable<dynamic> data;
  HistoryDataState(this.data);
}

class CatsFactErrorState extends CatsFactState{}

class  CatsFactDataState extends CatsFactState{
  final Data data;
  final String img;
  CatsFactDataState(this.data,this.img);
}