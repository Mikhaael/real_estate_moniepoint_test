import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_moniepoint_test/core/configs/app_config.dart';
import 'package:real_estate_moniepoint_test/feature/home/ui/bloc/home_bloc.dart';

class GlobalProvider extends StatelessWidget {
  const GlobalProvider({Key? key, required this.child, required this.appConfig})
      : super(key: key);

  final Widget child;
  final AppConfig appConfig;

  @override
  Widget build(BuildContext context) {
    // final apiManager = ApiManager(baseUrl: appConfig.apiConfig.baseUrl);
    return MultiBlocProvider(
      providers: [
        RepositoryProvider.value(value: appConfig),
        BlocProvider(
          create: (_) => HomeBloc(),
        ),
      ],
      child: Builder(builder: (context) {
        return BlocProvider(
          create: (_) => HomeBloc(),
          lazy: false,
          child: child,
        );
      }),
    );
  }
}
