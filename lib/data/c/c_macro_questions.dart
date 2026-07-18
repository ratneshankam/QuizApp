import 'package:flutter/material.dart';
import '../../models/question_model.dart';

 QuizTopic cMacroTopic = QuizTopic(
  topicName: "Hello World & Macros",
  description:
      "Hello World, Comments, Preprocessor Directives, Macros and enum",
  icon: Icons.code,
  color: Colors.orange,
  questions: [
    QuestionModel(
      question: "Which function is the standard entry point of a C program?",
      options: [
        "start()",
        "run()",
        "main()",
        "begin()",
      ],
      answerIndex: 2,
      description:
          "Execution of a hosted C program begins with the main() function.",
    ),

    QuestionModel(
      question: "Which header is required for using printf()?",
      options: [
        "<stdlib.h>",
        "<stdio.h>",
        "<string.h>",
        "<math.h>",
      ],
      answerIndex: 1,
      description:
          "The printf() function is declared in the stdio.h header file.",
    ),

    QuestionModel(
      question: "Which type of comment can span multiple lines?",
      options: [
        "// Comment",
        "/* Comment */",
        "# Comment",
        "-- Comment",
      ],
      answerIndex: 1,
      description:
          "Block comments enclosed within /* */ can span multiple lines.",
    ),

    QuestionModel(
      question: "Which statement about comments in C is TRUE?",
      options: [
        "Comments are executed by the compiler.",
        "Comments increase program speed.",
        "Comments are ignored during compilation.",
        "Comments change variable values.",
      ],
      answerIndex: 2,
      description:
          "Comments are ignored by the compiler and are used only to improve code readability.",
    ),

    QuestionModel(
      question: "Which symbol begins a preprocessor directive?",
      options: [
        "@",
        "\$",
        "#",
        "&",
      ],
      answerIndex: 2,
      description:
          "All preprocessor directives begin with the '#' symbol.",
    ),

    QuestionModel(
      question: "Which preprocessor directive includes a header file?",
      options: [
        "#define",
        "#include",
        "#ifdef",
        "#pragma",
      ],
      answerIndex: 1,
      description:
          "The #include directive inserts the contents of another file during preprocessing.",
    ),

    QuestionModel(
      question: "What is the primary purpose of a macro?",
      options: [
        "Allocate memory",
        "Create functions",
        "Text substitution before compilation",
        "Execute at runtime",
      ],
      answerIndex: 2,
      description:
          "Macros perform textual substitution during the preprocessing stage before compilation.",
    ),

    QuestionModel(
      question: "Which macro definition is valid?",
      options: [
        "#define PI 3.14159",
        "#macro PI 3.14159",
        "define PI 3.14159",
        "#include PI",
      ],
      answerIndex: 0,
      description:
          "Macros are defined using the #define directive.",
    ),

    QuestionModel(
      question: "What is the value of PI after preprocessing?\n#define PI 3.14",
      options: [
        "Variable",
        "Memory address",
        "Text 3.14",
        "Function",
      ],
      answerIndex: 2,
      description:
          "The preprocessor replaces every occurrence of PI with the text '3.14'.",
    ),

    QuestionModel(
      question: "Which keyword is used to declare an enumeration?",
      options: [
        "enum",
        "enumerate",
        "typedef",
        "struct",
      ],
      answerIndex: 0,
      description:
          "The enum keyword defines an enumeration type in C.",
    ),
        QuestionModel(
      question: "What is the default value of the first enumerator in an enum?",
      options: [
        "1",
        "-1",
        "0",
        "Undefined",
      ],
      answerIndex: 2,
      description:
          "Unless specified otherwise, the first enumerator in an enum has the value 0.",
    ),

    QuestionModel(
      question: "Given:\n\nenum Day {MON, TUE, WED};\n\nWhat is the value of WED?",
      options: [
        "1",
        "2",
        "3",
        "0",
      ],
      answerIndex: 1,
      description:
          "Enumerators are assigned consecutive integer values starting from 0. Therefore MON=0, TUE=1 and WED=2.",
    ),

    QuestionModel(
      question: "Which directive is used for conditional compilation?",
      options: [
        "#include",
        "#define",
        "#ifdef",
        "#error",
      ],
      answerIndex: 2,
      description:
          "The #ifdef directive allows sections of code to be compiled only if a macro is defined.",
    ),

    QuestionModel(
      question: "Which of the following is a function-like macro?",
      options: [
        "#define MAX 100",
        "#define SQR(x) ((x)*(x))",
        "#include <stdio.h>",
        "#ifdef DEBUG",
      ],
      answerIndex: 1,
      description:
          "Function-like macros accept parameters and perform textual substitution.",
    ),

    QuestionModel(
      question: "Why are parentheses recommended in function-like macros?",
      options: [
        "To improve compiler speed",
        "To avoid operator precedence issues",
        "To reduce memory usage",
        "To declare local variables",
      ],
      answerIndex: 1,
      description:
          "Parentheses ensure expressions are evaluated correctly after macro expansion.",
    ),

    QuestionModel(
      question: "Which statement about macros is TRUE?",
      options: [
        "Macros consume memory like variables.",
        "Macros are expanded before compilation.",
        "Macros are executed at runtime.",
        "Macros always return a value.",
      ],
      answerIndex: 1,
      description:
          "Macro expansion occurs during preprocessing, before the compiler translates the source code.",
    ),

    QuestionModel(
      question: "Which predefined macro contains the current source file name?",
      options: [
        "__TIME__",
        "__FILE__",
        "__DATE__",
        "__LINE__",
      ],
      answerIndex: 1,
      description:
          "__FILE__ expands to a string containing the name of the current source file.",
    ),

    QuestionModel(
      question: "Which predefined macro contains the current line number?",
      options: [
        "__FILE__",
        "__DATE__",
        "__LINE__",
        "__TIME__",
      ],
      answerIndex: 2,
      description:
          "__LINE__ expands to the current line number in the source file.",
    ),

    QuestionModel(
      question: "Which predefined macro expands to the compilation date?",
      options: [
        "__DATE__",
        "__TIME__",
        "__FILE__",
        "__STDC__",
      ],
      answerIndex: 0,
      description:
          "__DATE__ expands to the date on which the source file was compiled.",
    ),

    QuestionModel(
      question: "Which statement best describes an enum in C?",
      options: [
        "It stores floating-point values.",
        "It defines a set of named integer constants.",
        "It is a collection of characters.",
        "It is another name for a macro.",
      ],
      answerIndex: 1,
      description:
          "An enumeration defines a user-defined type consisting of named integer constants, making programs more readable.",
    ),
  ],
);