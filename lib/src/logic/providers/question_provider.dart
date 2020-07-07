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
      explain:
          'Nine species from the list have gone extinct since 1973, including the dusky seaside sparrow and the blue pike. Only 14 have recovered enough to be delisted.',
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
          'Western lowland gorillas have been threatened by which of the following?',
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
    Question(
      id: 5,
      text: 'Which of the following groups is disappearing the fastest?',
      options: [
        'Land species',
        'Sea species',
        'Freshwater species',
      ],
      answer: 2,
      explain:
          'Freshwater animals are vanishing at a rate four to six times as fast as those on land or at sea. Lakes, swamps, and rivers are home to as many as 126,000 of the world\'s animal species, including snails, mussels, crocodiles, turtles',
    ),
    Question(
      id: 6,
      text: 'Which sea turtle is the most critically endangered?',
      options: [
        'Olive ridley',
        'Leatherback',
        'Green sea turtle',
        'Kemp\'s ridley',
      ],
      answer: 3,
      explain:
          'The Kemp\'s ridley turtle is the world’s most endangered sea turtle, with a worldwide female nesting population roughly estimated at just 1,000 individuals. Its perilous situation is The kemp\'s attributed primarily to the overharvesting of eggs during the last century.',
    ),
    Question(
      id: 7,
      text:
          'What was the first animal to join the endangered species list because of climate change?',
      options: [
        'Gentoo penguin',
        'Polar bear',
        'Roseate spoonbill',
        'Artic fox',
      ],
      answer: 1,
      explain:
          'In 2008 polar bears were listed as threatened under the U.S. Endangered Species Act, the first animals added because of climate change. The continuing loss of sea ice in the Arctic puts the bears in jeopardy.',
    ),
    Question(
      id: 8,
      text:
          'What animals have recovered sufficiently to be removed from the U.S. list of endangered and threatened species?',
      options: [
        'Bald eagle',
        'American alligator',
        'Peregrine falcon',
        'All of the above',
      ],
      answer: 3,
      explain:
          'Each of these species—and 11 others—recovered enough to be delisted in the U.S. The bald eagle, for instance, was restored from fewer than 500 nesting pairs in 1963 to some 10,000 pairs in 2007.',
    ),
    Question(
      id: 9,
      text:
          'How many animal species were listed as critically endangered by the IUCN in 2010?',
      options: [
        '887',
        '1657',
        '4323',
        '11760',
      ],
      answer: 1,
      explain:
          'In 2010, 1,657 animals were named as "critically endangered" on the IUCN Red List, an annual ranking of global conservation status—14 more than in 2009.',
    )
  ];

  Map<int, int> _currentAnswers = {};
  int _currentScore = 0;

  List<Question> get trivia {
    return _trivia.sublist(0, 5);
    //return trivia;
  }

  int get currentScore {
    return _currentScore;
  }

  void startTrivia() {
    _trivia.shuffle();
    _currentAnswers = {};
    _currentScore = 0;
  }

  bool answer(int id, int answer) {
    var question = _trivia.firstWhere((q) => q.id == id);
    var correct = false;
    if (question == null) {
      throw 'Question not found';
    }

    if (question.answer == answer) {
      _currentScore++;
      correct = true;
    }
    _currentAnswers[id] = answer;
    print(_currentAnswers);
    notifyListeners();
    return correct;
  }
}
