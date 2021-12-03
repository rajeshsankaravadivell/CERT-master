import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pert/constants/constants.dart';
import 'package:pert/models/assesment.dart';
import 'package:pert/widgets/customtextbox.dart';

class TakeAssesment extends StatefulWidget {
  const TakeAssesment({Key? key, required this.assessment}) : super(key: key);
  final Assessment assessment;
  @override
  _TakeAssesmentState createState() => _TakeAssesmentState();
}

class _TakeAssesmentState extends State<TakeAssesment> {
  @override
  void initState() {
    print(widget.assessment.totalQuestions);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var future = widget.assessment.submit(authController.auth.currentUser!.uid);
          showDialog(
              context: context,
              builder: (context) {
                return FutureBuilder<Map<String, dynamic>>(
                    future: future,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          var object = snapshot.data;
                          return AlertDialog(
                            content: Text(object!["message"]),
                            title: Text(object["code"]),
                            actions: [TextButton(onPressed: () {
                              Navigator.of(context).pop();
                            }, child: Text("Okay"))],
                          );
                        }
                        return const Center(child: CircularProgressIndicator());
                      }
                      return const Center(child: CircularProgressIndicator());
                    });
              });
        },
      ),
      appBar: AppBar(centerTitle: true, backgroundColor: Colors.red, title: Text(widget.assessment.title)),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(left: 8, right: 8),
              itemCount: widget.assessment.totalQuestions,
              itemBuilder: (BuildContext context, int index) {
                switch (widget.assessment.questions[index].type) {
                  case QuestionType.mcq:
                    return Container(color: Colors.red, height: 50);
                  case QuestionType.boolean:
                    return BooleanQuestion(question: widget.assessment.questions[index], index: index);
                  case QuestionType.typed:
                    return WrittenQuestion(question: widget.assessment.questions[index], index: index);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class WrittenQuestion extends StatelessWidget {
  WrittenQuestion({Key? key, required this.question, required this.index}) : super(key: key);
  final Question question;
  final int index;
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Question ${index + 1}", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(question.question),
          ),
          CustomTextBox(
            leftPad: 8,
            keyboardType: TextInputType.text,
            controller: controller,
            hintText: "Enter your Answer here",
            labelText: "Answer",
            onChanged: (String changeText) {
              question.answer = changeText;
            },
          ),
          Divider(thickness: 5),
        ],
      ),
    );
  }
}

class BooleanQuestion extends StatefulWidget {
  BooleanQuestion({Key? key, required this.question, required this.index}) : super(key: key);

  final Question question;
  final int index;

  @override
  State<BooleanQuestion> createState() => _BooleanQuestionState();
}

class _BooleanQuestionState extends State<BooleanQuestion> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
        // Card(child: Container(height: 50));
        Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Question ${widget.index + 1}", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.question.question),
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: RadioListTile<bool>(
                    title: Text("Yes"),
                    value: true,
                    groupValue: widget.question.questionBool,
                    onChanged: (boolValue) {
                      setState(() {
                        widget.question.questionBool = boolValue;
                      });
                    }),
              ),
              // Expanded(flex: 6, child: const Text("Yes", style: TextStyle(fontWeight: FontWeight.bold))),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: RadioListTile<bool>(
                    title: Text("No"),
                    value: false,
                    groupValue: widget.question.questionBool,
                    onChanged: (boolValue) {
                      setState(() {
                        widget.question.questionBool = boolValue;
                      });
                    }),
              ),

              // Expanded(flex: 6, child: const Text("No", style: TextStyle(fontWeight: FontWeight.bold))),
            ],
          ),
          Divider(thickness: 5),
        ],
      ),
    );
  }
}
