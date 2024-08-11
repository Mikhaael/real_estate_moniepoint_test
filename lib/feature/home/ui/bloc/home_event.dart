part of 'home_bloc.dart';

abstract class HomeEvent with AppLogger {
  handle(HomeBloc bloc, Emitter<HomeState> emit);
}

class ResetHomeBloc extends HomeEvent {
  @override
  handle(HomeBloc bloc, Emitter<HomeState> emit) async {
    emit(HomeState.initial());
  }
}
