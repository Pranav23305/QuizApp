import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State createState() => _QuizAppState();
}

class SingleQuestionModel {
  final String? question;
  final List<String>? options;
  final int? answerIndex;

  const SingleQuestionModel({this.question, this.options, this.answerIndex});
}

class _QuizAppState extends State {
  List allQuestion = [
    const SingleQuestionModel(
        question: "Who is founder of MICROSOFT?",
        options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
        answerIndex: 2),
    const SingleQuestionModel(
      question: "Who is the founder of APPLE?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      answerIndex: 0,
    ),
    const SingleQuestionModel(
      question: "Who is the founder of AMAZON?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      answerIndex: 1,
    ),
    const SingleQuestionModel(
      question: "Who is the founder of TESLA?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      answerIndex: 3,
    ),
    const SingleQuestionModel(
      question: "Who is the founder of GOOGLE?",
      options: ["Steve Jobs", "Lary Page", "Bill Gates", "Elon Musk"],
      answerIndex: 1,
    ),
  ];

  bool questionScreen = true;
  int questionIndex = 0;
  int selectedAnswerIndex = -1;
  int correctAnswers = 0;

  MaterialStateProperty<Color?>? checkAnswer(int buttonIndex) {
    if (selectedAnswerIndex != -1) {
      if (selectedAnswerIndex == buttonIndex) {
        if (selectedAnswerIndex == allQuestion[questionIndex].answerIndex) {
          return const MaterialStatePropertyAll(Colors.green);
        } else {
          return const MaterialStatePropertyAll(Colors.red);
        }
      } else {
        if (buttonIndex == allQuestion[questionIndex].answerIndex) {
          return const MaterialStatePropertyAll(Colors.green);
        }
      }
    } else {
      return const MaterialStatePropertyAll(null);
    }
  }

  void checkPageValid() {
    if (selectedAnswerIndex == -1) {
      return;
    }
    if (selectedAnswerIndex == allQuestion[questionIndex].answerIndex) {
      correctAnswers++;
    }
    if (selectedAnswerIndex != -1) {
      if (questionIndex == allQuestion.length - 1) {
        questionScreen = false;
      }
      selectedAnswerIndex = -1;
      setState(() {
        questionIndex++;
      });
    }
  }

  Scaffold isQuestionScreen() {
    if (questionScreen == true) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'QuizApp',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Container(
          color: const Color.fromARGB(255, 19, 72, 207),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Question : ',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Text(
                    "${questionIndex + 1}/${allQuestion.length}",
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 380,
                height: 50,
                child: Center(
                  child: Text(
                    allQuestion[questionIndex].question,
                    style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(0),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    setState(() {
                      selectedAnswerIndex = 0;
                    });
                  }
                },
                child: Text(
                  "A.${allQuestion[questionIndex].options[0]}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(1),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    setState(() {
                      selectedAnswerIndex = 1;
                    });
                  }
                },
                child: Text(
                  "B.${allQuestion[questionIndex].options[1]}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(2),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    setState(() {
                      selectedAnswerIndex = 2;
                    });
                  }
                },
                child: Text(
                  "C.${allQuestion[questionIndex].options[2]}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(3),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    setState(() {
                      selectedAnswerIndex = 3;
                    });
                  }
                },
                child: Text(
                  "D.${allQuestion[questionIndex].options[3]}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: checkPageValid,
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.forward,
            color: Colors.blue,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "QuizApp",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: const Color.fromARGB(255, 19, 72, 207),
          child: Center(
            child: Column(
              children: [
                Image.network(
                  "https://cdn-icons-png.flaticon.com/512/4436/4436481.png",
                  height: 400,
                  width: 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Congratulation!! You have passed the test",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text("$correctAnswers/${allQuestion.length}"),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    selectedAnswerIndex = -1;
                    questionIndex = 0;
                    questionScreen = true;
                    correctAnswers = 0;
                    setState(() {});
                  },
                  child: const Text(
                    "Reset",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}
