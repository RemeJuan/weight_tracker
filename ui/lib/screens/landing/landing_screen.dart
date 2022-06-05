import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:line_chart/charts/line-chart.widget.dart';
import 'package:line_chart/model/line-chart.model.dart';
import 'package:weight_tracker/locator.dart';
import 'package:weight_tracker/screens/landing/cubit/landing_cubit.dart';
import 'package:weight_tracker/screens/landing/cubit/landing_state.dart';
import 'package:weight_tracker/screens/landing/widgets/history_view.dart';
import 'package:weight_tracker/screens/landing/widgets/weight_entry.dart';
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const WeightEntry(),
                const SizedBox(height: 16),
                const Text(
                  'Your history',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                LineChart(
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  insidePadding: 50,
                  data: state.history.reversed
                      .map(
                        (e) => LineChartModel(
                          date: DateTime.parse(e.created),
                          amount: e.weight.toDouble(),
                        ),
                      )
                      .toList(),
                  linePaint: Paint()
                    ..strokeWidth = 3
                    ..style = PaintingStyle.stroke
                    ..color = Colors.blue,
                  circlePaint: Paint()..color = Colors.white,
                  circleRadiusValue: 4,
                  showPointer: true,
                  showCircles: true,
                ),
                const Expanded(
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
