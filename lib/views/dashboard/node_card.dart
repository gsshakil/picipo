import 'package:flutter/material.dart';

class NodeCard extends StatelessWidget {
  const NodeCard({
    Key? key,
    required this.title,
    required this.balance,
    required this.color,
  }) : super(key: key);

  final String title;
  final String balance;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: Text(
        balance,
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(fontWeight: FontWeight.bold)
            .copyWith(color: color),
      ),
    );
  }
}
