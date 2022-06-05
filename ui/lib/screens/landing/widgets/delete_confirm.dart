part of "history_view.dart";

Future<void> _deleteDialog(
  BuildContext context,
  UserWeightModel weight,
) async {
  final cubit = context.read<LandingCubit>();
  final date = DateTime.parse(weight.created);

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
            const Text("Are you sure you want to delete this weight?"),
            const SizedBox(height: 8),
            Text(
              "${weight.weight.toString()} kg created on ${DateFormat.yMMMd().format(date)} at ${DateFormat.Hm().format(date)}",
            )
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel', style: TextStyle(color: Colors.red)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('Delete', style: TextStyle(color: Colors.blue)),
            onPressed: () {
              cubit.deleteWeight(weight);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
