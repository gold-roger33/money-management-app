import 'package:flutter/material.dart';
import 'package:p_money_management/db/category/category_db.dart';
import 'package:p_money_management/model/category/category_model.dart';

class screentransaction extends StatefulWidget {
  static const routname = "add-transactions";
  const screentransaction({super.key});

  @override
  State<screentransaction> createState() => _screentransactionState();
}

class _screentransactionState extends State<screentransaction> {
  DateTime? _selectedDate;
  categoryType? _selectedCategorytype;
  categoryModel? _selectedCategoryModel;
  
  String? _categoryid;

  @override
  void initState() {
    _selectedCategorytype = categoryType.income;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //PURPOSE
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: "purpose",
                      ),
                    ),

                    //AMOUNT
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: "Amount",
                      ),
                    ),

                    //calender
                    TextButton.icon(
                      onPressed: () async {
                        final _selectedDateTemp = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now()
                                .subtract(const Duration(days: 30)),
                            lastDate: DateTime.now());

                        if (_selectedDateTemp == null) {
                          return;
                        } else {
                          print(_selectedDateTemp.toString());
                          setState(() {
                            _selectedDate = _selectedDateTemp;
                          });
                        }
                      },
                      icon: const Icon(Icons.calendar_today),
                      label: Text(_selectedDate == null
                          ? 'Selected Date'
                          : _selectedDate!.toString()),
                    ),
                    //category
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: categoryType.income,
                              groupValue: _selectedCategorytype,
                              onChanged: (newvalue) {
                                setState(() {
                                  _selectedCategorytype = categoryType.income;
                                  _categoryid = null;
                                });
                              },
                            ),
                            const Text("Income"),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: categoryType.expense,
                              groupValue: _selectedCategorytype,
                              onChanged: (newvalue) {
                                setState(() {
                                  _selectedCategorytype = categoryType.expense;
                                  _categoryid =null;
                                });
                              },
                            ),
                            const Text("Expense"),
                          ],
                        ),
                      ],
                    ),

                    //CATEGORY TYPE
                    DropdownButton(
                        hint: const Text("Select category"),
                        value: _categoryid,
                        items: (_selectedCategorytype == categoryType.income
                                ? categoryDB().incomecategorylistListener
                                : categoryDB().expensecategorylistListener)
                            .value
                            .map((e) {
                          return DropdownMenuItem(
                              value: e.id, child: Text(e.name));
                        }).toList(),
                        onChanged: (selectedvalue) {
                          setState(() {
                          _categoryid=selectedvalue;  
                          });
                        }),

                    //SUBMIT BUTTON

                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Submit"),
                    )
                  ],
                ))));
  }
}


 /*
 Radio(
                                value: categoryType.income,
                                groupValue: categoryType.income,
                                onChanged: (newvalue) {}),
                            const Text("income")
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: categoryType.expense,
                                groupValue: categoryType.expense,
                                onChanged: (newvalue) {}),
                            const Text("Expense"),
                          ],
                        ), */