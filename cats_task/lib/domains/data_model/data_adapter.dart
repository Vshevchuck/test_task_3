import 'package:hive/hive.dart';

import 'cats_fact_model.dart';

class DataAdapter extends TypeAdapter<Data> {
  @override
  final typeId = 0;

  @override
  Data read(BinaryReader reader) {
    final data = reader.read();
    final origin = reader.read();
    final country = reader.read();
    final bread = reader.read();
    final coat = reader.read();
    final pattern = reader.read();
    return Data(
        data: data,
        breed: bread,
        country: country,
        origin: origin,
        coat: coat,
        pattern: pattern);
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer.write(obj.data);
    writer.write(obj.origin);
    writer.write(obj.country);
    writer.write(obj.breed);
    writer.write(obj.coat);
    writer.write(obj.pattern);
  }
}
