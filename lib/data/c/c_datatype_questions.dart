import 'package:flutter/material.dart';
import '../../models/question_model.dart';

QuizTopic cDataTypeTopic = QuizTopic(
  topicName: "Data Types",
  description:
      "Data Types, Identifiers, Rules of Identifiers, Declarations and Constants",
  icon: Icons.storage,
  color: Colors.green,
  questions: [
    QuestionModel(
      question: "Which declaration is valid in standard C?",
      options: [
        "int 2x;",
        "int _temp;",
        "float enum;",
        "int long float;",
      ],
      answerIndex: 1,
      description:
          "_temp is a valid identifier. Identifiers cannot begin with a digit, keywords cannot be used as variable names, and 'int long float' is not a valid declaration.",
    ),

    QuestionModel(
      question:
          "Which identifier is legal but poor practice because it shadows a library function?",
      options: [
        "printf",
        "value_1",
        "_index",
        "sum",
      ],
      answerIndex: 0,
      description:
          "Although legal in some contexts, using names like 'printf' for your own identifiers should be avoided because they shadow standard library functions.",
    ),

    QuestionModel(
      question: "Which declaration creates two integer variables?",
      options: [
        "int a, b;",
        "int a();",
        "int(a,b);",
        "integer a,b;",
      ],
      answerIndex: 0,
      description:
          "'int a, b;' declares two integer variables. 'int a();' declares a function.",
    ),

    QuestionModel(
      question: "Which literal has type long long int in C99?",
      options: [
        "10L",
        "10LL",
        "10UL",
        "10F",
      ],
      answerIndex: 1,
      description:
          "The suffix 'LL' specifies a long long integer literal.",
    ),

    QuestionModel(
      question: "Which suffix denotes an unsigned long constant?",
      options: [
        "UL",
        "LU",
        "Both UL and LU",
        "ULL only",
      ],
      answerIndex: 2,
      description:
          "Both UL and LU are valid suffix combinations for unsigned long constants.",
    ),

    QuestionModel(
      question: "Which is NOT an integer constant?",
      options: [
        "075",
        "0x1F",
        "3.0",
        "101",
      ],
      answerIndex: 2,
      description:
          "3.0 is a floating-point constant, whereas the others are integer constants.",
    ),

    QuestionModel(
      question: "Which declaration is invalid?",
      options: [
        "const int x = 10;",
        "int const x = 10;",
        "const x = 10;",
        "volatile int y;",
      ],
      answerIndex: 2,
      description:
          "'const' must always be accompanied by a type specifier.",
    ),

    QuestionModel(
      question: "Which token is an identifier?",
      options: [
        "while",
        "main",
        "#include",
        "++",
      ],
      answerIndex: 1,
      description:
          "'main' is an identifier. 'while' is a keyword, '#include' is a preprocessor directive, and '++' is an operator.",
    ),

    QuestionModel(
      question: "Which statement about char is always true?",
      options: [
        "It is exactly 8 bits.",
        "sizeof(char) == 1.",
        "It is always signed.",
        "It stores only ASCII.",
      ],
      answerIndex: 1,
      description:
          "The C standard guarantees sizeof(char) is always 1 byte.",
    ),

    QuestionModel(
      question: "Which declaration does NOT define a variable?",
      options: [
        "extern int x;",
        "int x;",
        "static int x;",
        "register int x;",
      ],
      answerIndex: 0,
      description:
          "An extern declaration normally declares an object defined elsewhere and does not allocate storage.",
    ),
        QuestionModel(
      question: "Which keyword prevents modification of a variable after initialization?",
      options: [
        "static",
        "volatile",
        "const",
        "register",
      ],
      answerIndex: 2,
      description:
          "The 'const' qualifier makes an object read-only after it has been initialized.",
    ),

    QuestionModel(
      question: "Which of the following is a valid floating-point constant?",
      options: [
        "10.5",
        "10..5",
        "10.5.2",
        ".",
      ],
      answerIndex: 0,
      description:
          "10.5 is a valid floating-point constant. The remaining options are invalid numeric literals.",
    ),

    QuestionModel(
      question: "Which identifier is invalid?",
      options: [
        "_count",
        "student1",
        "total_marks",
        "total-marks",
      ],
      answerIndex: 3,
      description:
          "Hyphens (-) are not allowed in C identifiers. Use underscores (_) instead.",
    ),

    QuestionModel(
      question: "Which declaration correctly declares a constant floating-point variable?",
      options: [
        "const float pi = 3.14f;",
        "float const = 3.14;",
        "const pi = 3.14;",
        "float const 3.14;",
      ],
      answerIndex: 0,
      description:
          "A type specifier is mandatory. 'const float pi = 3.14f;' is the correct declaration.",
    ),

    QuestionModel(
      question: "Which of the following is NOT a fundamental data type in C?",
      options: [
        "int",
        "char",
        "float",
        "string",
      ],
      answerIndex: 3,
      description:
          "C does not provide a built-in string data type. Strings are represented as character arrays.",
    ),

    QuestionModel(
      question: "Which integer constant is written in hexadecimal form?",
      options: [
        "075",
        "0x7A",
        "1111010",
        "72",
      ],
      answerIndex: 1,
      description:
          "Hexadecimal integer constants begin with the prefix '0x' or '0X'.",
    ),

    QuestionModel(
      question: "Which declaration is valid?",
      options: [
        "double value;",
        "double-value;",
        "double 2value;",
        "double float;",
      ],
      answerIndex: 0,
      description:
          "'double value;' is the only syntactically correct declaration.",
    ),

    QuestionModel(
      question: "Which keyword is used to declare a variable whose value may change unexpectedly outside the program?",
      options: [
        "volatile",
        "const",
        "extern",
        "register",
      ],
      answerIndex: 0,
      description:
          "The 'volatile' qualifier tells the compiler not to optimize accesses because the value may change unexpectedly.",
    ),

    QuestionModel(
      question: "Which of the following is a valid declaration of multiple variables?",
      options: [
        "int a, b, c;",
        "int a b c;",
        "int, a, b, c;",
        "integer a, b, c;",
      ],
      answerIndex: 0,
      description:
          "Multiple variables of the same type are declared by separating their names with commas.",
    ),

    QuestionModel(
      question: "Which statement about identifiers in C is correct?",
      options: [
        "Identifiers may begin with a digit.",
        "Keywords can be used as identifiers.",
        "Identifiers are case-sensitive.",
        "Spaces are allowed in identifiers.",
      ],
      answerIndex: 2,
      description:
          "C identifiers are case-sensitive. For example, 'sum', 'Sum', and 'SUM' are three different identifiers.",
    ),
  ],
);