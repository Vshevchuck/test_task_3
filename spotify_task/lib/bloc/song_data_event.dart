class SongDataEvent {}

class GetSongsDataEvent extends SongDataEvent {
  final String url;
  GetSongsDataEvent(this.url);
}
class SetInitialEvent extends SongDataEvent {}
