import 'package:flutter/material.dart';
import 'package:flutter_expense_app/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;
  TransactionList(this.userTransactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: userTransactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 20),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text('\$${userTransactions[index].amount}')),
                      ),
                    ),
                    title: Text(userTransactions[index].title,
                        style: Theme.of(context).textTheme.headline6),
                    subtitle: Text(DateFormat.yMMMd()
                        .format(userTransactions[index].date)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete,
                          color: Theme.of(context).errorColor),
                      onPressed: () =>
                          deleteTransaction(userTransactions[index].id),
                    ),
                  ),
                );
              },
              itemCount: userTransactions.length,
            ),
    );
  }
}

// Card(
//                   child: Row(
//                     children: [
//                       Container(
//                         margin:
//                             EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                           color: Theme.of(context).primaryColor,
//                           width: 2,
//                         )),
//                         child: Text(
//                           '\$${userTransactions[index].amount.toStringAsFixed(2)}',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                               color: Theme.of(context).primaryColor),
//                         ),
//                         padding: EdgeInsets.all(10),
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             userTransactions[index].title,
//                             style: Theme.of(context).textTheme.headline6,
//                           ),
//                           Text(
//                               DateFormat.yMMMd()
//                                   .format(userTransactions[index].date),
//                               style: TextStyle(
//                                 color: Colors.grey,
//                               )),
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
