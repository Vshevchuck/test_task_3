import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify_task/domains/data_model/data_model.dart';

import '../../../util/colors/colors_style.dart';

class SongWidget extends StatelessWidget {
  final DataModel dataModel;
  const SongWidget({Key? key,required this.dataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorStyle.listTileColor,
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 35, // Image radius
            backgroundImage:
            NetworkImage(dataModel.img),
          ),
          title: Text(
            dataModel.songName,
          ),
          subtitle: Row(
            children: [
              Text(
                softWrap: true,
                dataModel.artistName,
                maxLines: 2,
                style: const TextStyle(fontSize: 12),
              ),
              const Spacer(),
              Text(
                '${dataModel.duration} min',
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
