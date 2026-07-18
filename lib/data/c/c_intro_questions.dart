import 'package:flutter/material.dart';
import '../../models/question_model.dart';

QuizTopic cIntroTopic = QuizTopic(
  topicName: "Introduction to C",
  description:
      "History of C, Binary Numbers, ASCII and Binary-ASCII Conversion",
  icon: Icons.computer,
  color: Colors.blue,
  questions: [
    QuestionModel(
      question: "Which language directly influenced the design of C?",
      options: [
        "ALGOL",
        "B",
        "Pascal",
        "PL/I",
      ],
      answerIndex: 1,
      description:
          "C evolved from the B programming language, which itself was derived from BCPL.",
    ),

    QuestionModel(
      question: "Why was C preferred for UNIX development?",
      options: [
        "Purely interpreted",
        "Hardware independent yet efficient",
        "Object oriented",
        "Automatic memory management",
      ],
      answerIndex: 1,
      description:
          "C provides portability while still producing efficient machine code, making it ideal for operating systems.",
    ),

    QuestionModel(
      question: "Which statement about ANSI C (C89/C90) is correct?",
      options: [
        "First ISO standard",
        "Introduced classes",
        "First standardized C specification",
        "Introduced templates",
      ],
      answerIndex: 2,
      description:
          "ANSI C (C89/C90) was the first official standardization of the C language.",
    ),

    QuestionModel(
      question: "Binary 110101101 equals?",
      options: [
        "421",
        "429",
        "437",
        "445",
      ],
      answerIndex: 1,
      description:
          "110101101₂ = 256 + 128 + 32 + 8 + 4 + 1 = 429.",
    ),

    QuestionModel(
      question:
          "Without converting fully, which binary number is divisible by 8?",
      options: [
        "10110101",
        "11101000",
        "10011110",
        "11001101",
      ],
      answerIndex: 1,
      description:
          "A binary number divisible by 8 must end with three zeros (000).",
    ),

    QuestionModel(
      question: "ASCII binary 01011010 represents?",
      options: [
        "z",
        "Z",
        "Y",
        "9",
      ],
      answerIndex: 1,
      description:
          "01011010₂ = 90 decimal, which is the ASCII code for 'Z'.",
    ),

    QuestionModel(
      question: "Which pair differs by exactly one bit?",
      options: [
        "01000001 & 01100001",
        "01000001 & 01000011",
        "00110000 & 00110011",
        "01011010 & 01111010",
      ],
      answerIndex: 0,
      description:
          "'A' (65) and 'a' (97) differ only in bit number 5.",
    ),

    QuestionModel(
      question: "ASCII 01100001 converted to hexadecimal is?",
      options: [
        "0x41",
        "0x61",
        "0x31",
        "0x51",
      ],
      answerIndex: 1,
      description:
          "01100001₂ equals hexadecimal 0x61, which is ASCII for 'a'.",
    ),

    QuestionModel(
      question: "Decimal 173 in binary is?",
      options: [
        "10101101",
        "10110101",
        "11001101",
        "11101101",
      ],
      answerIndex: 0,
      description:
          "173 = 128 + 32 + 8 + 4 + 1 = 10101101₂.",
    ),

    QuestionModel(
      question: "Which ASCII range represents digits?",
      options: [
        "30–39",
        "48–57",
        "64–90",
        "97–122",
      ],
      answerIndex: 1,
      description:
          "ASCII decimal values 48–57 correspond to characters '0' through '9'.",
    ),    QuestionModel(
      question: "Binary 1000001 is interpreted as 7-bit ASCII. Character?",
      options: [
        "@",
        "A",
        "a",
        "!",
      ],
      answerIndex: 1,
      description:
          "1000001₂ equals decimal 65, which is the ASCII code for 'A'.",
    ),

    QuestionModel(
      question: "If ASCII('A') = 65, ASCII('F') is?",
      options: [
        "68",
        "69",
        "70",
        "71",
      ],
      answerIndex: 2,
      description:
          "ASCII characters are consecutive. Since 'A' is 65, 'F' is 70.",
    ),

    QuestionModel(
      question:
          "Which representation minimizes conversion errors in digital systems?",
      options: [
        "Decimal",
        "Binary",
        "Roman",
        "BCD only",
      ],
      answerIndex: 1,
      description:
          "Computers operate natively in binary, avoiding unnecessary conversion errors.",
    ),

    QuestionModel(
      question:
          "Binary 11111111 interpreted as an unsigned 8-bit integer equals?",
      options: [
        "127",
        "128",
        "255",
        "256",
      ],
      answerIndex: 2,
      description:
          "All eight bits are set, giving the maximum unsigned 8-bit value of 255.",
    ),

    QuestionModel(
      question: "Which statement is TRUE?",
      options: [
        "ASCII stores Unicode characters",
        "Standard ASCII uses 7 bits",
        "ASCII uses base-16",
        "ASCII has 512 symbols",
      ],
      answerIndex: 1,
      description:
          "Standard ASCII is a 7-bit character encoding with 128 possible characters.",
    ),

    QuestionModel(
      question: "Decimal value of binary 100110011 is?",
      options: [
        "299",
        "307",
        "301",
        "315",
      ],
      answerIndex: 1,
      description:
          "100110011₂ = 256 + 32 + 16 + 2 + 1 = 307.",
    ),

    QuestionModel(
      question:
          "Which conversion is easiest using repeated division by 2?",
      options: [
        "Binary → Decimal",
        "Decimal → Binary",
        "ASCII → Binary",
        "Hex → ASCII",
      ],
      answerIndex: 1,
      description:
          "Repeated division by 2 is the standard algorithm for converting decimal numbers to binary.",
    ),

    QuestionModel(
      question: "Binary ASCII for character '0' is?",
      options: [
        "00110000",
        "01010000",
        "00000000",
        "00110001",
      ],
      answerIndex: 0,
      description:
          "Character '0' has ASCII value 48, which is 00110000₂.",
    ),

    QuestionModel(
      question: "Which of these is NOT a feature of C?",
      options: [
        "Low-level memory access",
        "Portable",
        "Automatic garbage collection",
        "Structured programming",
      ],
      answerIndex: 2,
      description:
          "C provides manual memory management and does not include automatic garbage collection.",
    ),

    QuestionModel(
      question: "Which sequence correctly traces C's evolution?",
      options: [
        "BCPL → B → C",
        "B → BCPL → C",
        "ALGOL → C → B",
        "Pascal → B → C",
      ],
      answerIndex: 0,
      description:
          "The evolution was BCPL → B → C, with C designed by Dennis Ritchie based on B.",
    ),
  ],
);
