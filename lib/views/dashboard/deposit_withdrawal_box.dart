import 'package:flutter/material.dart';

class DepositWithdrawelBox extends StatelessWidget {
  const DepositWithdrawelBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 81),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      color: Colors.amber,
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Center(
                          child: Text(
                            'DEPOSIT',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: MaterialButton(
                      color: Colors.amber,
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Center(
                          child: Text(
                            'WITHDRAWAL',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Card(
                color: Color.fromARGB(255, 236, 157, 182),
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Get In Touch',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            const SizedBox(height: 10),
                            Text(
                                'We are always here \nif you have any questions',
                                style: Theme.of(context).textTheme.bodyText1!),
                          ],
                        ),
                        MaterialButton(
                          color: Colors.amber,
                          onPressed: () {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            child: Center(
                              child: Text(
                                'SUBMIT A\nREQUEST',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ]),
          ),
        ));
  }
}
