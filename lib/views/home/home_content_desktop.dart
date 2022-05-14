import 'package:flutter/material.dart';
import 'package:picipo/providers/home_provider.dart';
import 'package:picipo/widgets/dropdown_list.dart';
import 'package:provider/provider.dart';

class HomeContentDesktop extends StatelessWidget {
  const HomeContentDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeProvider(),
        builder: (context, snapshot) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.5,
            padding: const EdgeInsets.only(
              bottom: 50,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.15,
              vertical: MediaQuery.of(context).size.height * 0.05,
            ),
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
                      const DropdownList(),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter Number of Token',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.attach_money_sharp),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 60,
                        child: Consumer<HomeProvider>(
                            builder: (context, provider, child) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary:
                                    const Color.fromARGB(255, 142, 51, 146)),
                            onPressed: provider.isLoading
                                ? null
                                : () async {
                                    provider.setLoading(true);
                                    await Future.delayed(
                                        const Duration(seconds: 2));
                                    provider.setLoading(false);
                                  },
                            child: Center(
                              child: provider.isLoading
                                  ? const SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: CircularProgressIndicator())
                                  : const Text('ENTER STAKE AMOUNT'),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          );
        });
  }
}
