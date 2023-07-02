import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/infrastructure/architecture/cubits/messager/messenger_cubit.dart';
import 'package:pokemon_app/infrastructure/responsive/layout_breakpoint.dart';
import 'package:pokemon_app/infrastructure/routing/router.dart';
import 'package:pokemon_app/infrastructure/service_locator/locator_container.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PokemonApp extends StatelessWidget {
  const PokemonApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MessengerCubit>(),
      child: MaterialApp.router(
        theme: ThemeData(fontFamily: 'CircularStd'),
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(),
        builder: (context, child) =>
            BlocListener<MessengerCubit, MessengerState>(
          listener: (context, state) {
            if (state is MessengerIdle) return;
            if (state is MessengerSnackbar) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
                backgroundColor: state.backgroundColor(context),
              ));
            }
            context.read<MessengerCubit>().idle();
          },
          child:  ResponsiveWrapper.builder(
                  ClampingScrollWrapper.builder(context, child!),
                  breakpoints: LayoutBreakpoint.values
                      .map((e) => ResponsiveBreakpoint.resize(
                          e.breakPoint.toDouble(),
                          name: e.name))
                      .toList()),
        ),
      ),
    );
  }
}
