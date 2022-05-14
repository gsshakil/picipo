import 'package:flutter/material.dart';
import 'package:picipo/views/home/deposit_form.dart';

class StakeDepositForm extends StatefulWidget {
  const StakeDepositForm({Key? key}) : super(key: key);

  @override
  State<StakeDepositForm> createState() => _StakeDepositFormState();
}

class _StakeDepositFormState extends State<StakeDepositForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SizedBox(
          height: 80,
          width: 150,
          child: Image.asset('assets/ufarm-logo.png'),
        ),
        const SizedBox(height: 20),
        Text(
          'Employee Staking as a Service',
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(height: 30),
        DepositForm(formKey: _formKey, amountController: _amountController),
      ]),
    );
  }
}
