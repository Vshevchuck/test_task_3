import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:test_task/domains/data_model/data_model.dart';

class HtmlAlbumClient {
  Future<DataModel> spotify(link) async {
    final response = await http.Client().get(Uri.parse(link));
    var document = parse(response.body);
    String img = '';
    String nameSong = '';
    String nameAuth = '';
    String duration = '';
    final images = document.querySelectorAll('meta');
    for (final anchor in images) {
      final property = anchor.attributes['property'];
      final name = anchor.attributes['content'];
      if (property == "og:image") {
        img = name ?? "";
      }
    }
    final nameSongHtml = document.querySelectorAll('meta');
    for (final anchor in nameSongHtml) {
      final property = anchor.attributes['property'];
      final name = anchor.attributes['content'];
      if (property == "og:title") {
        nameSong = name ?? "";
      }
    }
    final nameAuthHtml = document.querySelectorAll('meta');
    for (final anchor in nameAuthHtml) {
      final property = anchor.attributes['property'];
      final name = anchor.attributes['content'];
      if (property == "og:description") {
        nameAuth = name ?? "";
      }
    }
    final durationHtml = document.querySelectorAll('meta');
    for (final anchor in durationHtml) {
      final content = anchor.attributes['content'];
      final name = anchor.attributes['name'];
      if (name == "music:duration") {
        duration = content ?? "";
        duration = formatTime(int.parse(duration));
      }
    }
    DataModel data = DataModel(nameSong, nameAuth, duration, img);
    return data;
  }

  String formatTime(int seconds) {
    int sec = seconds % 60;
    int min = (seconds / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }
}
