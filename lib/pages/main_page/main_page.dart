import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/bloc/song_data_bloc.dart';
import 'package:test_task/domains/api_clients/html_album_client.dart';
import 'package:test_task/domains/api_clients/html_client.dart';
import 'package:test_task/pages/main_page/widgets/list_of_users_widget.dart';
import 'package:test_task/util/colors/colors_style.dart';
import 'dart:io';
import 'dart:convert';
import '../../util/decorations/decorations.dart';


class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SongDataBloc>(
      create: (context) => SongDataBloc(),
      child: Scaffold(
        appBar: AppBar(backgroundColor: ColorStyle.chatAppBarColor, title: const Text('Spotify musics')),
        body: Container(
            height: double.maxFinite,
            decoration: Decorations.backgroundMainDecoration,
            child: const ListOfSongsWidget()),
      ),
    );
  }
}
