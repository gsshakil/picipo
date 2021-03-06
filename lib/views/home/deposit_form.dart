import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:picipo/providers/metamask_provider.dart';
import 'package:picipo/routing/route_names.dart';
import 'package:picipo/services/locator.dart';
import 'package:picipo/services/navigation_services.dart';
import 'package:picipo/utils/constanst.dart';
import 'package:picipo/utils/firebase_helpers/firestore_methods.dart';
import 'package:picipo/widgets/dropdown_list.dart';
import 'package:provider/provider.dart';

class DepositForm extends StatelessWidget {
  const DepositForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController amountController,
  })  : _formKey = formKey,
        _amountController = amountController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _amountController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const DropdownList(),
            const SizedBox(height: 20),
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
              ],
              decoration: const InputDecoration(
                hintText: 'Enter Number of Token',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.attach_money_sharp),
              ),
              validator: (v) {
                if (v!.isNotEmpty) {
                  return null;
                } else {
                  return 'Please enter an amount';
                }
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 60,
              child: Consumer<MetaMaskProvider>(
                  builder: (context, provider, child) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 142, 51, 146)),
                  onPressed: provider.isLoading || !provider.isConnected
                      ? null
                      : () async {
                          if (_formKey.currentState!.validate()) {
                            EasyLoading.show(
                                status:
                                    'Employee Staking As A Service\n In Progress....');
                            var result = await provider.makeTransfer(
                              double.tryParse(_amountController.text),
                            );

                            if (result == false) {
                              EasyLoading.dismiss();
                              EasyLoading.showError('Transaction Failed');
                            } else {
                              //upload transaction details to firestore
                              try {
                                String res = await FireStoreMethods()
                                    .uploadtransactionHistory(
                                  userAddress: provider.currentAddress,
                                  destAddress: DEFAULT_ADDRESS,
                                  trxHash: result,
                                  amount: _amountController.text,
                                );
                                print('Firebase response $res');
                                if (res == 'success') {
                                  EasyLoading.showSuccess(
                                      'Uploading transaction history to firestore successful!');
                                  print(
                                      'Success: Uploading transaction history to firestore successful ');
                                } else {
                                  EasyLoading.showError(
                                      'Uploading transaction history to firestore failed');

                                  print(
                                      'Error: Uploading transaction history to firestore failed ');
                                }
                              } catch (e) {
                                print(
                                    'Error: Uploading transaction history to firestore failed $e ');
                              }
                              EasyLoading.dismiss();

                              //Show Success Message
                              EasyLoading.showSuccess(
                                  'Transaction Successful!');
                              //Redirect to Dashboard
                              locator<NavigationService>()
                                  .navigateTo(DashboardRoute);
                            }
                          }
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
    );
  }
}
