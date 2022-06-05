import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:weight_tracker/models/user_weight_model.dart';
import 'package:weight_tracker/screens/landing/cubit/landing_cubit.dart';
import 'package:weight_tracker/screens/landing/cubit/landing_state.dart';

part 'delete_confirm.dart';
part 'edit_weight.dart';

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
        if (history.isEmpty) {
          return const Center(child: Text('No weight has been entered yet.'));
        }
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
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => _editDialog(context, weight),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _deleteDialog(context, weight),
                  )
                ],
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
