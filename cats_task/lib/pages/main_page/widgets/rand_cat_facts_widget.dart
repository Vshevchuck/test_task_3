import 'package:cats_task/bloc/cats_fact_bloc.dart';
import 'package:cats_task/bloc/cats_fact_state.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../bloc/cats_fact_event.dart';
import '../../../util/colors/colors_style.dart';
import '../../../util/text_styles/text_styles.dart';

class RandCatFactsWidget extends StatefulWidget {
  RandCatFactsWidget({Key? key}) : super(key: key);
  bool addFavorite = false;

  @override
  State<RandCatFactsWidget> createState() => _RandCatFactsWidgetState();
}

class _RandCatFactsWidgetState extends State<RandCatFactsWidget> {
  @override
  Widget build(BuildContext context) {
    final CatsFactBloc catBloc = BlocProvider.of<CatsFactBloc>(context);
    if (catBloc.state is CatsFactEmptyState) {
      catBloc.add(GetNewFactEvent());
    }
    return BlocBuilder<CatsFactBloc, CatsFactState>(builder: (context, state) {
      if (state is CatsFactDataState) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 24.0, right: 24.0, top: 8, bottom: 8),
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      catBloc.add(SetInitialFactEvent());
                      setState(() {
                        widget.addFavorite = false;
                      });
                    },
                    child: const Text('Another fact!')),
                const SizedBox(
                  height: 30,
                ),
                Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.network(state.img, fit: BoxFit.fill),
                      ),
                      ListTile(
                        title: Text(
                            style: TextStyles.nameTextStyle,
                            'Breed ${state.data.breed}'),
                        subtitle: Wrap(
                          children: [
                            Text('Country ${state.data.country},'),
                            Text('Origin ${state.data.origin}'),
                            Align(alignment:Alignment.bottomRight,child: Text(formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]))),
                          ],
                        ),
                      ),
                      IconButton(
                          alignment: Alignment.centerRight,
                          color: Colors.red,
                          onPressed: () {
                            setState(() {
                              catBloc.add(AddFactsToHistoryEvent(state.data));
                              widget.addFavorite = true;
                            });
                          },
                          icon: widget.addFavorite
                              ? const Icon(Icons.favorite_outlined)
                              : const Icon(Icons.favorite_border))
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
      return Center(
          child: LoadingAnimationWidget.stretchedDots(
            color: Colors.white,
            size: 80,));
    });
  }
}
