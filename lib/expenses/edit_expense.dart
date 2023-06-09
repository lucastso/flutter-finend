import 'package:date_format/date_format.dart';
import 'package:finend/auth/widgets/blue_button.dart';
import 'package:finend/configs/expense_income_provider.dart';
import 'package:flutter/material.dart';
import 'package:finend/expenses/models/expense.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class EditExpense extends StatefulWidget {
  final Expense expense;
  const EditExpense({super.key, required this.expense});

  @override
  State<EditExpense> createState() => _EditExpenseState();
}

class _EditExpenseState extends State<EditExpense> {
  TextEditingController inputNameController = TextEditingController();
  TextEditingController inputDataController = TextEditingController();
  TextEditingController inputValorController = TextEditingController();
  TextEditingController inputCategoryController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    inputNameController.text = widget.expense.name;
    inputDataController.text = widget.expense.date;
    inputValorController.text = widget.expense.value.toString();
    inputCategoryController.text = widget.expense.category;
  }

  @override
  Widget build(BuildContext context) {
    final incomeManager = Provider.of<ExpenseIncomeManager>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/home',
                          );
                        },
                        icon: const Icon(
                          Icons.chevron_left,
                          color: Color(0xFF242424),
                          size: 24,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        "Editar despesa",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF242424),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        "Nome:",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF242424),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 52,
                        child: TextField(
                          controller: inputNameController,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: const InputDecoration(
                            hintText: "Insira o nome da despesa",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.0),
                            ),
                            filled: true,
                            fillColor: Color(0xFFF4F4F4),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "Data:",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF242424),
                        ),
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: () => _selectDate(context),
                        child: Container(
                          height: 52,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_today),
                              const SizedBox(width: 8),
                              Text(
                                formatDate(
                                    selectedDate, [dd, '/', mm, '/', yyyy]),
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "Valor:",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF242424),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 52,
                        child: TextField(
                          controller: inputValorController,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: "Insira o valor da despesa",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.0),
                            ),
                            filled: true,
                            fillColor: Color(0xFFF4F4F4),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "Categoria:",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF242424),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 52,
                        child: TextField(
                          controller: inputCategoryController,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: const InputDecoration(
                            hintText: "Insira a categoria da despesa",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.0),
                            ),
                            filled: true,
                            fillColor: Color(0xFFF4F4F4),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      AuthBlueButton(
                        buttonLabel: "Editar despesa",
                        onPressed: () {
                          final String id = const Uuid().v4();
                          final String name = inputNameController.text;
                          final String date = formatDate(
                              selectedDate, [dd, '/', mm, '/', yyyy]);
                          final double value =
                              double.parse(inputValorController.text);
                          final String category = inputCategoryController.text;

                          if (name.isEmpty ||
                              inputValorController.text.isEmpty ||
                              category.isEmpty) {
                            return;
                          } else {
                            final newExpense = Expense(
                              id: id,
                              name: name,
                              value: value,
                              date: date,
                              type: 'Despesa',
                              category: category,
                            );
                            incomeManager.editExpense(
                                widget.expense.id, newExpense);
                          }

                          Navigator.of(context).pop();
                        },
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
