part of "history_view.dart";

Future<void> _editDialog(
  BuildContext context,
  UserWeightModel weight,
) async {
  final cubit = context.read<LandingCubit>();
  var w = weight;

  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    useSafeArea: true,
    builder: (context) {
      return AlertDialog(
        title: const Text('Confirmation'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              initialValue: weight.weight.toString(),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Weight',
                hintText: 'Update your weight',
              ),
              onChanged: (value) {
                w = weight.copyWith(weight: num.parse(value));
              },
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel', style: TextStyle(color: Colors.red)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('Update', style: TextStyle(color: Colors.blue)),
            onPressed: () {
              cubit.editWeight(w);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
