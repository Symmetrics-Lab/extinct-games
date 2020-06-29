import 'package:flutter/material.dart';

import '../../models/question.dart';

class QuestionProvider extends ChangeNotifier {
  final List<Question> _trivia = [
    Question(
      id: 0,
      text:
          'China\'s endangered giant pandas subsist almost entirely on what food?',
      options: [
        'Eucalyptus',
        'Hazelnuts',
        'Bamboo',
        'None of the above',
      ],
      answer: 2,
    ),
    Question(
      id: 1,
      text:
          'Since the U.S. Endangered Species Act was enacted in 1973, how many animals from the list have gone extinct?',
      options: [
        '0',
        '9',
        '3',
        '12',
      ],
      answer: 1,
    ),
    Question(
      id: 2,
      text: 'What was the last feline species to go extinct?',
      options: [
        'Iberian lynx',
        'Snow leopard',
        'Florida panther',
        'Saber-toothed cat',
      ],
      answer: 3,
      explain:
          'No feline species has gone extinct since the saber-toothed cat (Smilodon) perished 11000 years ago. The Iberian lynx could be next - there are only some 255 of them in the wild, far too few for long-term survival.',
    ),
    Question(
      id: 3,
      text:
          'Western lowland gorillas have been threatened by whic of the following?',
      options: [
        'Poachers',
        'Habitat loss',
        'The Ebola virus',
        'All of the above',
      ],
      answer: 3,
      explain:
          'Western lowland gorillas, have been ravaged by the Ebola virus, squeezed by habitat loss, and killed by poachers for bushmeat. No one knows how many of these critically endangered apes remain in the wild.',
    ),
    Question(
      id: 4,
      text:
          'What has killed off tens of thousands of amphibians in the last few decades?',
      options: [
        'A fungus',
        'Melting ice',
        'Bats',
        'Hurricanes',
      ],
      answer: 0,
      explain:
          'The exotic chytrid fungus is delivering the fatal blow to many amphibians already hit by habitat loss, pollution, and climate change. Chytrid has been reported on all contintents where frogs live and has afflicted at least 200 amphibian species.',
    ),
  ];

  Map<int, int> _currentAnswers = {};
  int _currentScore = 0;

  List<Question> get trivia {
    return _trivia;
  }

  int get currentScore {
    return _currentScore;
  }

  void startTrivia() {
    _currentAnswers = {};
    _currentScore = 0;
  }

  void answer(int id, int answer) {
    var question = _trivia.firstWhere((q) => q.id == id);
    if (question == null) {
      throw 'Question not found';
    }

    if (question.answer == answer) {
      _currentScore++;
    }
    _currentAnswers[id] = answer;
    print(_currentAnswers);
    notifyListeners();
  }
}
