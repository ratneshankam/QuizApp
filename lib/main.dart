import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'models/question_model.dart';
import 'data/c/c_intro_questions.dart';
import 'data/c/c_datatype_questions.dart';
import 'data/c/c_macro_questions.dart';
import 'data/c/c_format_questions.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Programming Quiz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber.shade900),
        textTheme: GoogleFonts.merriweatherTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: true,
      ),
      home: const QuizApp(),
    );
  }
}

// --- App Screen ---

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State<StatefulWidget> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizScreenState _currentScreen = QuizScreenState.intro;
  int _questionIndex = 0;
  int _selectedIndex = -1;
  int _score = 0;

  late QuizTopic _selectedTopic;
  List<int?> _selectedAnswers = [];

  final List<QuizTopic> _allTopics = [
    cIntroTopic,
    cDataTypeTopic,
    cMacroTopic,
    cFormatTopic,
  ];

  @override
  void initState() {
    super.initState();
    _selectedTopic = _createShuffledTopic(_allTopics[0]);
    _selectedAnswers = List.filled(_selectedTopic.questions.length, null);
  }

  void _resetQuiz() {
    setState(() {
      _selectedTopic = _createShuffledTopic(_selectedTopic);

      _selectedAnswers = List.filled(_selectedTopic.questions.length, null);

      _questionIndex = 0;
      _selectedIndex = -1;
      _score = 0;
      _currentScreen = QuizScreenState.intro;
    });
  }

  void _switchTopic(QuizTopic topic) {
    setState(() {
      _selectedTopic = _createShuffledTopic(topic);
      _selectedAnswers = List.filled(_selectedTopic.questions.length, null);
    });
    _resetQuiz();
    Navigator.pop(context); // Close the drawer
  }

int _calculateCurrentScore() {
  int score = 0;

  for (int i = 0; i < _selectedAnswers.length; i++) {
    if (_selectedAnswers[i] != null &&
        _selectedAnswers[i] ==
            _selectedTopic.questions[i].answerIndex) {
      score++;
    }
  }

  return score;
}
  void _nextQuestion() {
    if (_selectedAnswers[_questionIndex] == null) return;

    if (_questionIndex < _selectedTopic.questions.length - 1) {
      setState(() {
        _questionIndex++;
        _selectedIndex = _selectedAnswers[_questionIndex] ?? -1;
      });
    } else {
      _finishQuiz();
    }
  }

  void _previousQuestion() {
    if (_questionIndex == 0) return;

    setState(() {
      _questionIndex--;
      _selectedIndex = _selectedAnswers[_questionIndex] ?? -1;
    });
  }

  void _finishQuiz() {
    int score = 0;

    for (int i = 0; i < _selectedTopic.questions.length; i++) {
      if (_selectedAnswers[i] == _selectedTopic.questions[i].answerIndex) {
        score++;
      }
    }

    setState(() {
      _score = score;
      _currentScreen = QuizScreenState.result;
    });
  }

  Color _getButtonColor(int buttonIndex) {
    if (_selectedIndex == -1) {
      return Colors.white;
    }
    int correctAnswerIndex =
        _selectedTopic.questions[_questionIndex].answerIndex;

    if (buttonIndex == correctAnswerIndex) {
      return Colors.green.shade400;
    } else if (_selectedIndex == buttonIndex) {
      return Colors.red.shade400;
    } else {
      return Colors.grey;
    }
  }

  QuizTopic _createShuffledTopic(QuizTopic topic) {
    final questions = topic.questions.map(_shuffleQuestion).toList();

    questions.shuffle();

    return QuizTopic(
      topicName: topic.topicName,
      description: topic.description,
      icon: topic.icon,
      color: topic.color,
      questions: questions,
    );
  }

  QuestionModel _shuffleQuestion(QuestionModel q) {
    final indexed = <MapEntry<int, String>>[];

    for (int i = 0; i < q.options.length; i++) {
      indexed.add(MapEntry(i, q.options[i]));
    }

    indexed.shuffle();

    final options = indexed.map((e) => e.value).toList();

    int newAnswer = indexed.indexWhere((e) => e.key == q.answerIndex);

    return QuestionModel(
      question: q.question,
      options: options,
      answerIndex: newAnswer,
      description: q.description,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.amber.shade900,
        centerTitle: true,
        title: Text(
          "Quiz: ${_selectedTopic.topicName}",
          style: GoogleFonts.oswald(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      drawer: _buildDrawer(),
      body: SafeArea(child: _buildCurrentScreen()),
      floatingActionButton: _currentScreen == QuizScreenState.active
          ? Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.amber.shade100,
                      ),
                      padding: WidgetStatePropertyAll(
                        EdgeInsetsGeometry.symmetric(vertical: 20),
                      ),
                    ),
                    onPressed: _questionIndex == 0 ? null : _previousQuestion,
                    icon: Icon(Icons.arrow_back, color: Colors.amber.shade900),
                    label: Text(
                      "Previous",
                      style: TextStyle(
                        color: Colors.amber.shade900,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll(
                        EdgeInsetsGeometry.symmetric(vertical: 20),
                      ),
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.amber.shade900,
                      ),
                    ),
                    onPressed: _selectedAnswers[_questionIndex] == null
                        ? null
                        : _nextQuestion,
                    icon: Icon(
                      _questionIndex == _selectedTopic.questions.length - 1
                          ? Icons.check
                          : Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    label: Text(
                      _questionIndex == _selectedTopic.questions.length - 1
                          ? "Finish"
                          : "Next",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            )
          : null,
    );
  }

  Widget _buildCurrentScreen() {
    switch (_currentScreen) {
      case QuizScreenState.intro:
        return _buildIntroScreen();
      case QuizScreenState.active:
        return _buildActiveQuizScreen();
      case QuizScreenState.result:
        return _buildResultScreen();
      default:
        return const SizedBox();
    }
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.amber.shade900),
            child: const Center(
              child: Text(
                "Quiz  Topics",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _allTopics.length,
              itemBuilder: (context, index) {
                final topic = _allTopics[index];
                return ListTile(
                  leading: Icon(topic.icon, color: Colors.amber.shade900),
                  title: Text(
                    topic.topicName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () => _switchTopic(topic),
                  selected: _selectedTopic == topic,
                  selectedTileColor: Colors.amber.shade100,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIntroScreen() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(_selectedTopic.icon, size: 100, color: Colors.amber.shade900),
            const SizedBox(height: 30),
            Text(
              "Ready to test your knowledge?",
              textAlign: TextAlign.center,
              style: GoogleFonts.oswald(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Topic: ${_selectedTopic.topicName}\n${_selectedTopic.questions.length} Questions",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, color: Colors.black54),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber.shade900,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _selectedTopic = _createShuffledTopic(_selectedTopic);

                    _selectedAnswers = List.filled(
                      _selectedTopic.questions.length,
                      null,
                    );

                    _questionIndex = 0;
                    _selectedIndex = -1;

                    _currentScreen = QuizScreenState.active;
                  });
                },
                child: const Text(
                  "Let's Go!",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveQuizScreen() {
    final currentQuestion = _selectedTopic.questions[_questionIndex];
    _selectedIndex = _selectedAnswers[_questionIndex] ?? -1;
    final progress = (_questionIndex + 1) / _selectedTopic.questions.length;

    if (_selectedTopic.questions.isEmpty) {
      return Center(child: Text("No Questions Available"));
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Question ${_questionIndex + 1} of ${_selectedTopic.questions.length}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                ),
             Text("Score: ${_calculateCurrentScore()}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber.shade900,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey.shade300,
              color: Colors.amber.shade900,
              minHeight: 8,
              borderRadius: BorderRadius.circular(10),
            ),
            const SizedBox(height: 40),
            Text(
              currentQuestion.question,
              style: GoogleFonts.oswald(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 30),
            ...List.generate(currentQuestion.options.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = index;
                      _selectedAnswers[_questionIndex] = index;
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: _getButtonColor(index),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 16,
                    ),
                    side: BorderSide(
                      color: _selectedIndex == -1
                          ? Colors.grey.shade400
                          : Colors.transparent,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        String.fromCharCode(65 + index) + ".",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _selectedIndex == -1
                              ? Colors.amber.shade900
                              : Colors.white,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          currentQuestion.options[index],
                          style: TextStyle(
                            fontSize: 18,
                            color: _selectedIndex == -1
                                ? Colors.black87
                                : Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 20),
            if (_selectedIndex != -1)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.lightbulb_outline,
                          color: Colors.blue.shade700,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Explanation",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      currentQuestion.description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue.shade900,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 30),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildResultScreen() {
    double percentage = _score / _selectedTopic.questions.length;
    String message = percentage >= 0.7
        ? "Awesome Job! 💖"
        : percentage >= 0.5
        ? "Good Effort! 👍"
        : "Keep Learning! 📚";

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              percentage >= 0.7
                  ? "🏆"
                  : percentage >= 0.5
                  ? "😃"
                  : "🥲",
              style: GoogleFonts.oswald(
                fontSize: 100,
                fontWeight: FontWeight.bold,
                color: Colors.amber.shade900,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              message,
              style: GoogleFonts.oswald(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.amber.shade900,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "You scored $_score out of ${_selectedTopic.questions.length}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber.shade900,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: _resetQuiz,
                icon: const Icon(Icons.refresh),
                label: const Text(
                  "Restart Topic",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 60,
              // ✅ FIX: Wrap the button in a Builder to get a context below the Scaffold
              child: Builder(
                builder: (innerContext) {
                  return OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.amber.shade900,
                      side: BorderSide(color: Colors.amber.shade900, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      // ✅ FIX: Use 'innerContext' instead of 'context'
                      Scaffold.of(innerContext).openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                    label: const Text(
                      "Choose Another Topic",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
