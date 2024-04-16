import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State<StatefulWidget> createState() => _QuizAppState();
}

class SingleChildModel {
  final String? question;
  final List<String>? options;
  final int? answer;

  const SingleChildModel({this.question, this.options, this.answer});
}

class _QuizAppState extends State<StatefulWidget> {
  List allQuestions = [
    const SingleChildModel(
      question: "What is Flutter?",
      options: [
        "programming language",
        "mobile-dev framework",
        "database management",
        "graphic design tool"
      ],
      answer: 1,
    ),
    const SingleChildModel(
      question: "Which programming language used for Flutter development?",
      options: ["Java", "Kotlin", "Dart", "Swift"],
      answer: 2,
    ),
    const SingleChildModel(
      question: "What is a widget in Flutter?",
      options: [
        "Variable",
        "User interface element",
        "database table",
        "None of the above"
      ],
      answer: 1,
    ),
    const SingleChildModel(
      question: "What command is used to run a Flutter application?",
      options: [
        "flutter run",
        "flutter install",
        "flutter start",
        "flutter launch"
      ],
      answer: 0,
    ),
    const SingleChildModel(
      question: "What is the purpose of pubspec.yaml file?",
      options: [
        "temparary file",
        "UI Layout",
        "Platform Specifics",
        "Dependency Declaration"
      ],
      answer: 3,
    ),
  ];
  int questionIndex = 0;
  bool questionScreen = true;
  bool initialScreen = true;
  int selectedIndex = -1;
  int rightAnswerCnt = 0;
  List<String> description = [
    "Flutter is an open-source UI software development kit created by Google. It is used to develop applications for Android, iOS, Linux, Mac, Windows, Google Fuchsia, and the web from a single codebase.",
    "Dart is the programming language used for developing Flutter applications. It is a client-optimized language for fast apps on any platform.",
    "In Flutter, everything is a widget. Widgets are the basic building blocks of Flutter applications used to create user interfaces.",
    'The "flutter run" command is used to compile and run Flutter applications on connected devices or emulators.',
    "The pubspec.yaml file is primarily used for declaring project dependencies and configurations."
  ];
  MaterialStatePropertyAll<Color?> checkanswer(int buttonIndex) {
    if (selectedIndex != -1) {
      if (buttonIndex == allQuestions[questionIndex].answer) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (selectedIndex == buttonIndex) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return MaterialStatePropertyAll(Colors.orange.shade400);
      }
    } else {
      return MaterialStatePropertyAll(Colors.orange.shade400);
    }
  }

  void validateScreen() {
    if (selectedIndex == -1) {
      return;
    }

    if (selectedIndex == allQuestions[questionIndex].answer) {
      rightAnswerCnt++;
    }

    // if (selectedIndex != -1) {
    selectedIndex = -1;

    setState(() {
      if (questionIndex == allQuestions.length - 1) {
        questionScreen = false;
      }
    });

    setState(() {
      questionIndex++;
    });
    // }
  }

  Scaffold isQuestionScreen() {
    if (initialScreen == true) {
      return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.amber.shade900,
            title: const Text(
              "QuizApp",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            )),
        body: Center(
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.amber.shade900),
                  fixedSize: const MaterialStatePropertyAll(Size(250, 70))),
              onPressed: () {
                initialScreen = false;
                setState(() {});
              },
              child: const Text(
                "Let's Go",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
        ),
      );
    } else if (questionScreen == true && initialScreen == false) {
      return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.amber.shade900,
            title: const Text(
              "QuizApp",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              validateScreen();
            });
          },
          tooltip: "Next",
          focusColor: const Color.fromARGB(255, 190, 162, 1),
          backgroundColor: const Color.fromARGB(255, 223, 146, 4),
          hoverColor: const Color.fromARGB(255, 83, 146, 97),
          child: const Icon(Icons.forward),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Question No : ",
                      style: GoogleFonts.merriweather(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "${questionIndex + 1}/${allQuestions.length}",
                      style: GoogleFonts.merriweather(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  allQuestions[questionIndex].question,
                  style: GoogleFonts.oswald(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (selectedIndex == -1) {
                      setState(() {
                        selectedIndex = 0;
                      });
                    }
                  },
                  style: ButtonStyle(
                    fixedSize: const MaterialStatePropertyAll(Size(300, 52)),
                    backgroundColor: checkanswer(0),
                  ),
                  child: Text(
                    "A. ${allQuestions[questionIndex].options[0]}",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (selectedIndex == -1) {
                      setState(() {
                        selectedIndex = 1;
                      });
                    }
                  },
                  style: ButtonStyle(
                    fixedSize: const MaterialStatePropertyAll(Size(300, 52)),
                    backgroundColor: checkanswer(1),
                  ),
                  child: Text(
                    "B. ${allQuestions[questionIndex].options[1]}",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (selectedIndex == -1) {
                      setState(() {
                        selectedIndex = 2;
                      });
                    }
                  },
                  style: ButtonStyle(
                    fixedSize: const MaterialStatePropertyAll(Size(300, 52)),
                    backgroundColor: checkanswer(2),
                  ),
                  child: Text(
                    "C. ${allQuestions[questionIndex].options[2]}",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (selectedIndex == -1) {
                      setState(() {
                        selectedIndex = 3;
                      });
                    }
                  },
                  style: ButtonStyle(
                    fixedSize: const MaterialStatePropertyAll(Size(300, 52)),
                    backgroundColor: checkanswer(3),
                  ),
                  child: Text(
                    "D. ${allQuestions[questionIndex].options[3]}",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                (selectedIndex != -1)
                    ? Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.amber.shade100,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Text(
                          "Description: ${description[questionIndex]}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.amber.shade900,
            title: const Text(
              "QuizApp",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            )),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Image.network(
                "https://media.istockphoto.com/id/1176397624/vector/vector-flat-golden-trophy.jpg?s=612x612&w=0&k=20&c=kjnN3SB3l1cAMMt5xUvnyJDfPzQKzZ_pZHt3jaFnmF0=",
                height: 350,
                width: 400,
              ),
              Image.network(
                "https://media.istockphoto.com/id/1368531657/vector/congratulations-colorful-typography-banner.jpg?s=612x612&w=0&k=20&c=wLDsEtMDLracjmXSWOownzagyurdZH-lXlNLmZXWsVM=",
                height: 150,
                width: 450,
              ),
              const Text(
                "Better luck next time!😀",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Your score is:",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "$rightAnswerCnt/${allQuestions.length}",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.amber.shade900),
                      fixedSize: const MaterialStatePropertyAll(Size(250, 70))),
                  onPressed: () {
                    questionIndex = 0;
                    selectedIndex = -1;
                    questionScreen = true;
                    rightAnswerCnt = 0;
                    setState(() {});
                  },
                  child: const Text(
                    "Restart",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ))
            ],
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
