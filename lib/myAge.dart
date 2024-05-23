import 'package:flutter/material.dart';

class MyAge extends StatefulWidget {
  const MyAge({super.key});

  @override
  State<MyAge> createState() => _MyAgeState();
}

class _MyAgeState extends State<MyAge> {
  final dateController = TextEditingController();
  late String textAge = '';

  String dateISO(dateISOString){
    final df = DateTime.parse(dateISOString);
    late String day = df.day.toString();
    late String month = df.month.toString();
    late int year = df.year;
    return '$year-$month-$day'; 
  }

  calAge(int year, int month, int day){
    DateTime birthday = DateTime(year, month, day);

    DateTime now = DateTime.now();

    Duration diff = now.difference(birthday);
    int years = (diff.inDays / 365).floor();
    int months = ((diff.inDays % 365)/30).floor();
    int days = (diff.inDays % 365) % 30;

    setState(() {
      textAge = 'อายุ: $years ปี $months เดือน $days วัน';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("คำนวณอายุ"),
      ),
      body: SingleChildScrollView(
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height:  20.0),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: dateController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.calendar_today),
                    labelText: "วันเกิด"
                  ),
                  onTap: () async{
                    DateTime? pickDate = await showDatePicker(
                      context: context, 
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1987), 
                      lastDate: DateTime(2100)
                    );

                    if(pickDate != null){
                      calAge(pickDate.year, pickDate.month, pickDate.day);

                      setState(() {
                        dateController.text = dateISO(pickDate.toIso8601String());
                      });
                    }
                  },
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    textAge,
                    style: const TextStyle(
                      fontSize: 18
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}