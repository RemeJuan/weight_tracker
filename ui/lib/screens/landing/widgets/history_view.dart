import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:weight_tracker/models/user_weight_model.dart';
import 'package:weight_tracker/screens/landing/cubit/landing_cubit.dart';
import 'package:weight_tracker/screens/landing/cubit/landing_state.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final status = context.select<LandingCubit, HistoryStatus>(
      (c) => c.state.historyStatus,
    );
    final history = context.select<LandingCubit, List<UserWeightModel>>(
      (c) => c.state.history,
    );

    switch (status) {
      case HistoryStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case HistoryStatus.loaded:
        return ListView.builder(
          itemCount: history.length,
          shrinkWrap: true,
          itemBuilder: (context, idx) {
            final weight = history[idx];
            final date = DateTime.parse(weight.created);

            return ListTile(
              title: Text("${weight.weight.toString()} kg"),
              subtitle: Text(
                "${DateFormat.yMMMd().format(date)} at ${DateFormat.Hm().format(date)}",
              ),
            );
          },
        );

      case HistoryStatus.error:
        return Center(
          child: Column(
            children: [
              const Text('There was an error loading your history'),
              ElevatedButton(
                child: const Text('Try again'),
                onPressed: () => context.read<LandingCubit>().getHistory(),
              ),
            ],
          ),
        );
    }
  }
}
