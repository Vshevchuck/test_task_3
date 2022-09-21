import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

class HtmlClient {
  Future<List<dynamic>> spotify() async {
    final response = await http.Client().get(
        Uri.parse('https://open.spotify.com/playlist/3dpOdyAk3AVSSc0CqXQEA6'));
    var document = parse(response.body);
    final anchors = document.querySelectorAll('meta');
    int count = 0;
    String albumName = document.querySelectorAll('title').first.text;
    List<dynamic> albums = <dynamic>[];
    for (final anchor in anchors) {
      final content = anchor.attributes['content'];
      final name = anchor.attributes['name'];
      if (name.toString() == "music:song") {
        albums.add(content!);
        count++;
      }
    }
    albums.add(albumName);
    albums.add(count);
    return albums;
  }
}
