import 'package:spotify_task/bloc/song_data_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_task/bloc/user_data_state.dart';
import 'package:spotify_task/domains/api_clients/html_album_client.dart';
import 'package:spotify_task/domains/api_clients/html_client.dart';
import 'package:spotify_task/domains/data_model/data_model.dart';

class SongDataBloc extends Bloc<SongDataEvent, SongDataState> {
  @override
  get initialState => DataEmptyState();

  @override
  Stream<SongDataState> mapEventToState(SongDataEvent event) async* {
    if(event is SetInitialEvent)
      {
        yield DataEmptyState();
      }
    if (event is GetSongsDataEvent) {
      try {
        List<DataModel> data = <DataModel>[];
        HtmlClient getAlbum = HtmlClient();
        HtmlAlbumClient getSongs = HtmlAlbumClient();
        List<dynamic> dataAlbum = await getAlbum.spotify(event.url);
        for (int i = 0; i < dataAlbum.length - 2; i++) {
          data.add(await getSongs.spotify(dataAlbum[i]));
        }
        yield (LoadedDataState(data, await dataAlbum[dataAlbum.length - 1],
            await dataAlbum[dataAlbum.length - 2]));
      }
      catch(_){
        yield DataErrorState();
      }
    }
  }
}
