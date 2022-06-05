import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weight_tracker/screens/landing/cubit/landing_cubit.dart';
import 'package:weight_tracker/screens/landing/cubit/landing_state.dart';

class WeightEntry extends HookWidget {
  const WeightEntry({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final status = context.select<LandingCubit, CreateStatus>(
      (c) => c.state.createStatus,
    );
    final weightController = useTextEditingController();

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Enter your weight',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: TextFormField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Weight',
                  ),
                ),
              ),
              const SizedBox(width: 16),
              if (status != CreateStatus.submitting) ...[
                IconButton(
                  icon: const Icon(
                    Icons.check,
                    size: 18,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    context
                        .read<LandingCubit>()
                        .addWeight(weightController.text);
                    if (status == CreateStatus.success) {
                      weightController.clear();
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.clear,
                    size: 18,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    weightController.clear();
                  },
                )
              ],
              if (status == CreateStatus.submitting)
                const CircularProgressIndicator()
            ],
          ),
        ],
      ),
    );
  }
}
