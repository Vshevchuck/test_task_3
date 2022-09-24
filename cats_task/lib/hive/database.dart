import 'package:cats_task/domains/data_model/data_adapter.dart';
import 'package:date_format/date_format.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../domains/data_model/cats_fact_model.dart';

class DataBase {
  DataBase() {
    Hive.initFlutter();
  }

  addElementToBase(Data data) async {
    data.data=formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]);
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(DataAdapter());
    }
    var box = await Hive.openBox<Data>('data');
    box.add(data);
    box.close();
  }

  removeElementToBase(int index) async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(DataAdapter());
    }
    var box = await Hive.openBox<Data>('data');
    box.deleteAt(index);
  }

  Future<Iterable> hiveBase() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(DataAdapter());
    }
    var box = await Hive.openBox<Data>('data');
    dynamic data = box.values;
    box.close();
    return data;
  }
}
