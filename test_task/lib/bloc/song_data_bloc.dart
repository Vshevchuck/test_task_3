import 'package:test_task/bloc/song_data_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/bloc/user_data_state.dart';
import 'package:test_task/domains/api_clients/html_album_client.dart';
import 'package:test_task/domains/api_clients/html_client.dart';
import 'package:test_task/domains/data_model/data_model.dart';

class SongDataBloc extends Bloc<SongDataEvent, SongDataState> {
  @override
  get initialState => DataEmptyState();

  @override
  Stream<SongDataState> mapEventToState(SongDataEvent event) async* {
    if (event is GetSongsDataEvent) {
      List<DataModel> data = <DataModel>[];
      HtmlClient getAlbum = HtmlClient();
      HtmlAlbumClient getSongs = HtmlAlbumClient();
      List<dynamic> dataAlbum = await getAlbum.spotify();
      for (int i = 0; i < dataAlbum.length - 2; i++) {
        data.add(await getSongs.spotify(dataAlbum[i]));
      }
      yield (LoadedDataState(data, await dataAlbum[dataAlbum.length - 1],
          await dataAlbum[dataAlbum.length - 2]));
    }
  }
}
