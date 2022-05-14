import 'package:flutter/material.dart';

class WeeklyEstimateHeader extends StatelessWidget {
  const WeeklyEstimateHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            const Icon(Icons.auto_graph),
            const SizedBox(width: 10),
            Text(
              'Weekly Estimated Profit',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10),
            Text(
              'for May 2022',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ],
        ),
        Text(
          '8.3% in April 2022',
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}
