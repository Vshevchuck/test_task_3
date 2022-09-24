import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cats_task/bloc/cats_fact_event.dart';
import 'package:cats_task/bloc/cats_fact_state.dart';

import '../domains/api_clients/rest_client.dart';
import '../domains/data_model/cats_fact_model.dart';
import '../hive/database.dart';

class CatsFactBloc extends Bloc<CatsFactEvent, CatsFactState> {
  @override
  get initialState => CatsFactEmptyState();

  @override
  Stream<CatsFactState> mapEventToState(CatsFactEvent event) async* {
    DataBase history = DataBase();
    if (event is GoToHistoryEvent) {
      yield HistoryDataState(await history.hiveBase());
    }
    if (event is SetInitialFactEvent) {
      yield CatsFactEmptyState();
    }
    if (event is AddFactsToHistoryEvent) {
      history.addElementToBase(event.data);
    }
    if (event is DeleteFactEvent) {
      history.removeElementToBase(event.index);
    }
    if (event is GetNewFactEvent) {
      bool checkImg = false;
      final facts = await getFacts();
      var factNumber = Random().nextInt(40) + 1;
      String img = '';
      while (!checkImg) {
        var imgNumber = Random().nextInt(30) + 1;
        img = 'https://cataas.com/cat/$imgNumber'; //!
        http.Response response = await http.Client().get(Uri.parse(img));
        if (response.statusCode == 200) {
          checkImg = true;
        }
      }
      if (facts.data![factNumber] != null) {
        yield CatsFactDataState(facts.data![factNumber], img);
      } else {
        yield CatsFactErrorState();
      }
    }
  }

  Future<CatsFactModel> getFacts() async {
    final dio = Dio();
    dio.options.headers["Demo-Header"] = "demo header";
    final client = RestClient(dio);
    final facts = await client.getTasks();
    return facts;
  }
}
