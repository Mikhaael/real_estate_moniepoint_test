import 'package:bloc/bloc.dart';
import 'package:real_estate_moniepoint_test/core/logger/init_logger.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<HomeEvent>((event, emit) => event.handle(this, emit));
  }
}
