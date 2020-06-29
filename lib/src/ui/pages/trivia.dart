import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../logic/providers/question_provider.dart';
import '../widgets/question_item.dart';

class Trivia extends StatefulWidget {
  static const routeName = '/trivia';
  @override
  _TriviaState createState() => _TriviaState();
}

class _TriviaState extends State<Trivia> {
  var _currentQuestion = 0;
  var _currentAnswer = -1;

  @override
  void initState() {
    Provider.of<QuestionProvider>(context, listen: false).startTrivia();
    super.initState();
  }

  void selectAnswer(
    answer,
  ) {
    setState(() {
      _currentAnswer = answer;
    });
  }

  void nexQuestion(index) {
    Provider.of<QuestionProvider>(context, listen: false)
        .answer(_currentQuestion, _currentAnswer);
    setState(() {
      _currentAnswer = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var trivia = Provider.of<QuestionProvider>(context).trivia;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 20,
          ),
          Text('Question ${_currentQuestion + 1} / ${trivia.length}'),
          QuestionItem(
            question: trivia[_currentQuestion],
            onSelect: selectAnswer,
            selected: _currentAnswer,
          ),
          trivia.length == _currentQuestion + 1
              ? RaisedButton(
                  onPressed: () {
                    print('Finish');
                    nexQuestion(_currentQuestion);
                  },
                  child: Text('Finish'))
              : RaisedButton(
                  onPressed: () {
                    print('Next');
                    nexQuestion(_currentQuestion);
                    setState(() {
                      _currentQuestion = _currentQuestion + 1;
                      _currentAnswer = -1;
                    });
                  },
                  child: Text('Next'),
                ),
          SizedBox(
            height: 10,
          )
        ],
      )),
    );
  }
}
