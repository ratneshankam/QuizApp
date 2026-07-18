import 'package:flutter/material.dart';
import '../../models/question_model.dart';

 QuizTopic cFormatTopic = QuizTopic(
  topicName: "Input & Output",
  description:
      "printf(), scanf(), Format Specifiers and Escape Sequences",
  icon: Icons.keyboard,
  color: Colors.red,
  questions: [
    QuestionModel(
      question: "Which function is used to display output on the console?",
      options: [
        "scanf()",
        "printf()",
        "gets()",
        "puts()",
      ],
      answerIndex: 1,
      description:
          "printf() prints formatted output to the standard output device.",
    ),

    QuestionModel(
      question: "Which function is commonly used to read formatted input from the keyboard?",
      options: [
        "printf()",
        "scanf()",
        "puts()",
        "getchar()",
      ],
      answerIndex: 1,
      description:
          "scanf() reads formatted input according to the supplied format string.",
    ),

    QuestionModel(
      question: "Which format specifier is used for an int variable?",
      options: [
        "%f",
        "%c",
        "%d",
        "%s",
      ],
      answerIndex: 2,
      description:
          "%d is the standard format specifier for an int.",
    ),

    QuestionModel(
      question: "Which format specifier is used to print a float value?",
      options: [
        "%d",
        "%f",
        "%lf",
        "%c",
      ],
      answerIndex: 1,
      description:
          "%f is used with printf() for floating-point values.",
    ),

    QuestionModel(
      question: "Which format specifier is used for a character?",
      options: [
        "%s",
        "%c",
        "%d",
        "%x",
      ],
      answerIndex: 1,
      description:
          "%c prints or reads a single character.",
    ),

    QuestionModel(
      question: "Which format specifier is used for a string?",
      options: [
        "%c",
        "%s",
        "%d",
        "%p",
      ],
      answerIndex: 1,
      description:
          "%s is used for null-terminated character strings.",
    ),

    QuestionModel(
      question: "Which escape sequence moves the cursor to the next line?",
      options: [
        "\\t",
        "\\r",
        "\\n",
        "\\b",
      ],
      answerIndex: 2,
      description:
          "\\n inserts a newline character.",
    ),

    QuestionModel(
      question: "Which escape sequence inserts a horizontal tab?",
      options: [
        "\\a",
        "\\t",
        "\\v",
        "\\f",
      ],
      answerIndex: 1,
      description:
          "\\t inserts a horizontal tab.",
    ),

    QuestionModel(
      question: "Which escape sequence prints a backslash (\\)?",
      options: [
        "\\\\",
        "\\/",
        "\\b",
        "\\'",
      ],
      answerIndex: 0,
      description:
          "\\\\ is the escape sequence used to print a single backslash.",
    ),

    QuestionModel(
      question: "What will be printed?\n\nprintf(\"Hello\\nWorld\");",
      options: [
        "Hello World",
        "Hello\\nWorld",
        "Hello\nWorld",
        "Compilation Error",
      ],
      answerIndex: 2,
      description:
          "\\n moves the output to the next line, so 'World' appears on the line below 'Hello'.",
    ),
        QuestionModel(
      question: "Which format specifier is used with printf() to print a hexadecimal integer?",
      options: [
        "%o",
        "%x",
        "%d",
        "%u",
      ],
      answerIndex: 1,
      description:
          "%x prints an integer in hexadecimal notation using lowercase letters.",
    ),

    QuestionModel(
      question: "Which format specifier is used to print an unsigned integer?",
      options: [
        "%d",
        "%i",
        "%u",
        "%x",
      ],
      answerIndex: 2,
      description:
          "%u is used to print unsigned integer values.",
    ),

    QuestionModel(
      question: "Why is the '&' operator used with scanf() for most variables?",
      options: [
        "To increase speed",
        "To pass the variable's address",
        "To convert the value to hexadecimal",
        "It is optional",
      ],
      answerIndex: 1,
      description:
          "scanf() stores input into variables, so it requires their memory addresses.",
    ),

    QuestionModel(
      question: "Which statement correctly reads an integer into variable 'n'?",
      options: [
        "scanf(\"%d\", n);",
        "scanf(\"%d\", &n);",
        "scanf(n);",
        "scanf(&n, \"%d\");",
      ],
      answerIndex: 1,
      description:
          "The correct syntax is scanf(\"%d\", &n); where &n passes the address of n.",
    ),

    QuestionModel(
      question: "Which escape sequence produces a double quotation mark (\") in the output?",
      options: [
        "\\'",
        "\\\"",
        "\\\\",
        "\\?",
      ],
      answerIndex: 1,
      description:
          "\\\" is used inside string literals to print a double quotation mark.",
    ),

    QuestionModel(
      question: "What will the following statement print?\n\nprintf(\"%d\", 10/3);",
      options: [
        "3",
        "3.333333",
        "4",
        "Compilation Error",
      ],
      answerIndex: 0,
      description:
          "Both operands are integers, so integer division is performed. The result is 3.",
    ),

    QuestionModel(
      question: "Which escape sequence is used to produce a beep (alert) on supported systems?",
      options: [
        "\\b",
        "\\a",
        "\\t",
        "\\v",
      ],
      answerIndex: 1,
      description:
          "\\a represents the alert (bell) character. Its effect depends on the terminal or operating system.",
    ),

    QuestionModel(
      question: "Which statement about printf() is TRUE?",
      options: [
        "It can print formatted output.",
        "It reads keyboard input.",
        "It modifies variables directly.",
        "It always prints on two lines.",
      ],
      answerIndex: 0,
      description:
          "printf() is used to display formatted output to the standard output stream.",
    ),

    QuestionModel(
      question: "Which statement about scanf() is TRUE?",
      options: [
        "It prints formatted output.",
        "It returns the number of successfully matched input items.",
        "It cannot read floating-point values.",
        "It always returns 0.",
      ],
      answerIndex: 1,
      description:
          "scanf() returns the number of input items that were successfully read and assigned.",
    ),

    QuestionModel(
      question: "Which of the following is a valid escape sequence in C?",
      options: [
        "\\m",
        "\\k",
        "\\n",
        "\\y",
      ],
      answerIndex: 2,
      description:
          "\\n is the standard newline escape sequence. The others are not valid standard C escape sequences.",
    ),
  ],
);