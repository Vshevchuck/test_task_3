import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_task/bloc/song_data_bloc.dart';
import 'package:spotify_task/pages/main_page/widgets/list_of_users_widget.dart';
import 'package:spotify_task/util/colors/colors_style.dart';
import '../../util/decorations/decorations.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
  static final textController = TextEditingController();
  static bool check = false;
  static bool checkFind = true;
  static String url = '+';
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SongDataBloc>(
      create: (context) => SongDataBloc(),
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: ColorStyle.chatAppBarColor,
            title: const Text('Spotify Music')),
        body: Container(
            height: double.maxFinite,
            decoration: Decorations.backgroundMainDecoration,
            child: Column(
              children: [
                TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: MainPage.textController,
                  decoration: InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 2.0,
                            color:Colors.white)),
                    isCollapsed: true,
                    contentPadding: const EdgeInsets.only(top: 16.0),
                    prefixIcon: IconButton(
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          MainPage.check = true;
                          MainPage.checkFind = true;
                          MainPage.url = MainPage.textController.text;
                        });
                      },
                      icon: const Icon(Icons.search),
                    ),
                    hintStyle: const TextStyle(color: Colors.white),
                    hintText: 'album spotify link',
                  ),
                ),
                !MainPage.check
                    ? Column(
                        children: const [
                          SizedBox(
                            height: 35,
                          ),
                          Text(
                            'Insert link',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      )
                    : ListOfSongsWidget(url: MainPage.url),
              ],
            )),
      ),
    );
  }
}
