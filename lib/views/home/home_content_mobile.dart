import 'package:flutter/material.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
          horizontal: 0, vertical: MediaQuery.of(context).size.height * 0.05),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(70),
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(20),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            color: Color.fromARGB(255, 173, 168, 168),
            offset: Offset(0, 1),
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(children: [
        const SizedBox(height: 20),
        SizedBox(
          height: 80,
          width: 150,
          child: Image.asset('assets/ufarm-logo.png'),
        ),
        const SizedBox(height: 20),
        Text(
          'Calculate Your Earnings',
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.money,
                      color: Colors.red,
                    ),
                    hintText: 'UFARM',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter Number of Token',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.label_important_outline,
                      color: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 142, 51, 146)),
                    onPressed: () {},
                    child: const Center(
                      child: Text('ENTER STAKE AMOUNT'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
