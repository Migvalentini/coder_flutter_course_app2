// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty ? Column(
        children: [
          SizedBox(height: 20),
          Text(
            'No Transactions Registered!',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 20),
          Container(
            height: 200,
            child: Image.asset(
              'assets/images/waiting.png', 
              fit: BoxFit.cover, 
              height: 200,
            )
          )
        ],
      ) : ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          final tr = transactions[index];
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all( 
                      width: 2,
                      color: Theme.of(context).colorScheme.primary
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text('R\$ ${tr.value.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      tr.title,
                      style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
                    ),
                    Text(
                      DateFormat('d MMM y').format(tr.date),
                      style: TextStyle(color: Colors.grey),
                    )
                  ]
                )
              ]
            ),
          );
        },
      ),
    );
  }
}
