import 'package:bloc/bloc.dart';
import 'events.dart';
import '../backend.dart';

class LiveFeedBloc extends Bloc<LiveFeedEvent, int> {
  @override
  int get initialState => -1;

  @override
  Stream<int> mapEventToState(LiveFeedEvent event) async* {
    switch (event) {
      case LiveFeedEvent.init:
        print('init event');
        yield 0;
        break;
      case LiveFeedEvent.update:
        print('update event');
        yield 1;
        break;
    }
  }
}
