import 'package:bloc/bloc.dart';
import 'package:real_estate_moniepoint_test/core/logger/init_logger.dart';

class AppBlocObserver extends BlocObserver with AppLogger {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log.i(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log.e(error);
    super.onError(bloc, error, stackTrace);
  }
}
