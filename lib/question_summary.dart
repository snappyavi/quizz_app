import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  //postional arguments
  //to receive the values of list of String and object mapped to each other and variable named summaryData
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      //fixes a height
      child: SingleChildScrollView(
        //enables scrolling inside it
        child: Column(
          children:
              summaryData.map((data) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: 16,),
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color:
                            data['userAnswer'] == data['correctAnswer']
                                ? Colors.blue
                                : Colors.red,
                      ),
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    SizedBox(width: 20),
                    // helps in accessing dyanmic data
                    // we use typecasting as => what data we expect
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            data['userAnswer'] as String,
                            style: TextStyle(
                              color:
                                 Colors.black45,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            data['correctAnswer'] as String,
                            style: TextStyle(
                              color:
                                  data['userAnswer'] == data['correctAnswer']
                                      ? Colors.blue
                                      : Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
          //.map() converts list of Map key value pairs to Widgets
          //.map retuns Iterable List so we add .toList() to convert in the end
        ),
      ),
    );
  }
}
