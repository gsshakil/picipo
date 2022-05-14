import 'package:flutter/material.dart';

class WeeklyProfitCard extends StatelessWidget {
  const WeeklyProfitCard({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.balance,
    required this.color,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final String balance;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListTile(
        leading: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              subTitle,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ],
        ),
        trailing: Text(
          balance,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontWeight: FontWeight.bold)
              .copyWith(color: color),
        ),
      ),
    );
  }
}
