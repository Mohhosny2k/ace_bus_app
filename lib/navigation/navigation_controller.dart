import '../bus/bus_view/second_screen.dart';
import 'navigation_state.dart';
import '../shared/shared_screen/home_screen.dart';
import '../shared/shared_screen/profiel_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationController extends Cubit<NavigationStates> {
  NavigationController() : super(NavigationChangeState(0, HomeScreen()));

  final List _screens = [
    HomeScreen(),
    SecondScreen(),
    ProfielScreen(),
  ];

  void move(int index) {
    emit(NavigationChangeState(index, _screens[index]));
  }
}
