import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

class HtmlClient {
  Future<dynamic> spotify(String url) async {
    print(url);
    try {
      final response = await http.Client().get(
          Uri.parse(url));
      var document = parse(response.body);
      final anchors = document.querySelectorAll('meta');
      int count = 0;
      String albumName = document
          .querySelectorAll('title')
          .first
          .text;
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
    catch(_){
      return 'error';
    }
  }
}
