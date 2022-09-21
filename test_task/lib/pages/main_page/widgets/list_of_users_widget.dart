import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/bloc/song_data_event.dart';
import 'package:test_task/bloc/user_data_state.dart';
import 'package:test_task/pages/main_page/widgets/song_widget.dart';

import '../../../bloc/song_data_bloc.dart';
import '../../../util/colors/colors_style.dart';
import '../../../util/text_styles/text_styles.dart';

class ListOfSongsWidget extends StatelessWidget {
  const ListOfSongsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SongDataBloc songBloc = BlocProvider.of<SongDataBloc>(context);
    songBloc.add(GetSongsDataEvent());
    return BlocBuilder<SongDataBloc, SongDataState>(builder: (context, state) {
      if (state is LoadedDataState) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: state.length,
            itemBuilder: (context, index) {
              return index == 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: ColorStyle.mainContainerColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  state.title,
                                  style: TextStyles.titleTextStyle,
                                ),
                              )),
                        ),
                        SongWidget(dataModel: state.listOfSongs[index]),
                      ],
                    )
                  : SongWidget(dataModel: state.listOfSongs[index]);
            });
      }
      return const Center(
          child: CircularProgressIndicator(color: ColorStyle.indicatorColor));
    });
  }
}
