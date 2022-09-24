import '../domains/data_model/cats_fact_model.dart';

class CatsFactEvent {}

class GetNewFactEvent extends CatsFactEvent {}

class DeleteFactEvent extends CatsFactEvent {
  final int index;

  DeleteFactEvent(this.index);
}

class SetInitialFactEvent extends CatsFactEvent {}

class GoToHistoryEvent extends CatsFactEvent {}

class AddFactsToHistoryEvent extends CatsFactEvent {
  final Data data;

  AddFactsToHistoryEvent(this.data);
}
