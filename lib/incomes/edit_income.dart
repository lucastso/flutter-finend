import 'package:finend/auth/widgets/blue_button.dart';
import 'package:finend/configs/expense_income_provider.dart';
import 'package:finend/incomes/models/income.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:date_format/date_format.dart';
import 'package:uuid/uuid.dart';

class EditIncome extends StatefulWidget {
  final Income income;
  const EditIncome({Key? key, required this.income}) : super(key: key);

  @override
  State<EditIncome> createState() => _EditIncomeState();
}

class _EditIncomeState extends State<EditIncome> {
  TextEditingController inputNameController = TextEditingController();
  TextEditingController inputDataController = TextEditingController();
  TextEditingController inputValorController = TextEditingController();
  TextEditingController inputCategoryController = TextEditingController();

  @override
  void initState() {
    super.initState();

    inputNameController.text = widget.income.name;
    inputDataController.text = widget.income.date;
    inputValorController.text = widget.income.value.toString();
    inputCategoryController.text = widget.income.category;
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
                        "Editar receita",
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
                            hintText: "Insira o nome da receita",
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
                        onTap: () {
                          DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            onConfirm: (date) {
                              setState(() {
                                inputDataController.text =
                                    formatDate(date, [dd, '/', mm, '/', yyyy]);
                              });
                            },
                            currentTime: DateTime.now(),
                            locale: LocaleType.pt,
                          );
                        },
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
                                inputDataController.text,
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
                            hintText: "Insira o valor da receita",
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
                            hintText: "Insira a categoria da receita",
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
                        buttonLabel: "Editar receita",
                        onPressed: () {
                          final String id = const Uuid().v4();
                          final String name = inputNameController.text;
                          final String date = inputDataController.text;
                          final double value =
                              double.parse(inputValorController.text);
                          final String category = inputCategoryController.text;

                          if (name.isEmpty ||
                              date.isEmpty ||
                              inputValorController.text.isEmpty ||
                              category.isEmpty) {
                            return;
                          } else {
                            final newIncome = Income(
                              id: id,
                              name: name,
                              value: value,
                              date: date,
                              type: 'Receita',
                              category: category,
                            );
                            incomeManager.editIncome(
                                widget.income.id, newIncome);
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
