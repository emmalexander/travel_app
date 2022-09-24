//this file hold the states and check the states
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/pages/detail_page.dart';
import '../pages/nav_pages/main_page.dart';
import '../pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    //this is how it holds the cubits <AppCubits, CubitStates>
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      if (state is WelcomeState) {
        return WelcomePage();
      }
      if (state is LoadedState) {
        return MainPage();
      }
      if (state is DetailState) {
        return DetailPage();
      }
      if (state is LoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Container();
      }
    });
  }
}
