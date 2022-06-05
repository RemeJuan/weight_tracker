import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:weight_tracker/locator.dart';
import 'package:weight_tracker/screens/landing/cubit/landing_cubit.dart';
import 'package:weight_tracker/screens/landing/cubit/landing_state.dart';
import 'package:weight_tracker/screens/landing/widgets/history_view.dart';
import 'package:weight_tracker/templates/app_template.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return BlocProvider<LandingCubit>(
      create: (_) => sl<LandingCubit>()..getHistory(),
      child: BlocBuilder<LandingCubit, LandingState>(
        builder: (context, state) {
          return AppTemplate(
            child: Column(
              children: const [
                Text('Your history'),
                Expanded(
                  child: HistoryView(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
