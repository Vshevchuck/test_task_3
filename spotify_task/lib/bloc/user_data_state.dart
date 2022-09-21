import '../domains/data_model/data_model.dart';

class SongDataState {}

class LoadedDataState extends SongDataState {
  final List<DataModel> listOfSongs;
  final int length;
  final String title;

  LoadedDataState(this.listOfSongs,this.length,this.title);
}

class DataEmptyState extends SongDataState {}

class DataErrorState extends SongDataState {}
