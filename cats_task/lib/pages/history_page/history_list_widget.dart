import 'package:cats_task/bloc/cats_fact_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../bloc/cats_fact_bloc.dart';
import '../../bloc/cats_fact_state.dart';
import '../../util/colors/colors_style.dart';

class HistoryListWidget extends StatefulWidget {
  const HistoryListWidget({Key? key}) : super(key: key);

  @override
  State<HistoryListWidget> createState() => _HistoryListWidgetState();
}

class _HistoryListWidgetState extends State<HistoryListWidget> {
  @override
  Widget build(BuildContext context) {
    final CatsFactBloc catBloc = BlocProvider.of<CatsFactBloc>(context);
    catBloc.add(GoToHistoryEvent());
    return BlocBuilder<CatsFactBloc, CatsFactState>(builder: (context, state) {
      if (state is HistoryDataState) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(7.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.pets),
                    trailing: IconButton(
                        onPressed: () {
                          catBloc.add(DeleteFactEvent(index));
                          setState(() {

                          });
                        },
                        icon: const Icon(Icons.delete)),
                    title: Text(
                      'Breed ${state.data.toList()[index].breed}',
                    ),
                    subtitle: Wrap(
                      children: [
                        Text(
                          'Country ${state.data.toList()[index].country}',
                        ),
                        Text('Origin ${state.data.toList()[index].origin}'),
                        Text(
                          'Date ${state.data.toList()[index].data}',
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      }
      return Center(
          child: LoadingAnimationWidget.stretchedDots(
          color: Colors.white,
          size: 200,));
    });
  }
}
