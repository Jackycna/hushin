import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hushin/features/navigatonbar/navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(index: 0));
  selectedIndex(int index) => emit(NavigationState(index: index));
}
