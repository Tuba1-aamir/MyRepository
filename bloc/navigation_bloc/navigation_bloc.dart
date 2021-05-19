import 'package:bloc/bloc.dart';
import 'package:wehire/pages/myaccountspage.dart';
import 'package:wehire/pages/myorderspage.dart';
import 'package:wehire/pages/homepage.dart';
import '../../myloginscreen.dart';
                          //7

//our events
enum NavigationEvents {
  HomePageClickedEvent,
  MyAccountClickedEvent,
  MyOrdersClickedEvent,
}

abstract class NavigationStates {}
//every event is associated with an state
class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => MyAccountsPage();

  @override
  //for every event we'll go to the state accrodingly
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.MyAccountClickedEvent:
        yield MyAccountsPage();
        break;
      case NavigationEvents.MyOrdersClickedEvent:
        yield MyOrdersPage();
        break;
    }
  }
}