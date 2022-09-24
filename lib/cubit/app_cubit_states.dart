import 'package:equatable/equatable.dart';

import '../model/data_model.dart';

abstract class CubitStates extends Equatable {}

//Every Cubit app should have one initial state we should pass a state class or a state function

//state should hold data that is going to be changed for the rebuild of the UI
class InitialState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

//this is responsible for showing welcome screen once initialization as been done
class WelcomeState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedState extends CubitStates {
  LoadedState(this.places);
  final List<DataModel> places;
  @override
  // TODO: implement props
  //this list below is for the rebuilding of the UI
  List<Object> get props => [places];
}

class DetailState extends CubitStates {
  DetailState(this.place);
  final DataModel place;
  @override
  // TODO: implement props
  //this list below is for the rebuilding of the UI
  List<Object> get props => [place];
}
