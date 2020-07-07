import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../logic/providers/question_provider.dart';
import '../widgets/question_item.dart';
import '../widgets/finish_trivia.dart';

class Trivia extends StatefulWidget {
  static const routeName = '/trivia';
  @override
  _TriviaState createState() => _TriviaState();
}

class _TriviaState extends State<Trivia> {
  var _currentQuestion = 0;
  var _currentAnswer = -1;
  var _finished = false;
  var _answered = false;
  var _correct = false;
  var _currentQuestionID = -1;
  var trivia = null;
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

  bool nexQuestion(index) {
    var correct = Provider.of<QuestionProvider>(context, listen: false)
        .answer(trivia[_currentQuestion].id, _currentAnswer);
    setState(() {
      _currentAnswer = -1;
    });
    return correct;
  }

  void tryAgain() {
    Provider.of<QuestionProvider>(context, listen: false).startTrivia();
    setState(() {
      _currentAnswer = -1;
      _currentQuestion = 0;
      _currentQuestionID = -1;
      _finished = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    trivia = Provider.of<QuestionProvider>(context).trivia;
    var score =
        Provider.of<QuestionProvider>(context, listen: false).currentScore;
    return Scaffold(
      appBar: AppBar(
        title: Text('Trivia'),
      ),
      body: Container(
          child: _finished
              ? FinishTrivia(
                  count: trivia.length,
                  score: score,
                  tryAgain: tryAgain,
                )
              : Column(
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
                    _answered
                        ? (_correct
                            ? Text(
                                'Correct!',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.green,
                                ),
                              )
                            : Text(
                                'Fail',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.red),
                              ))
                        : SizedBox(),
                    trivia.length == _currentQuestion + 1
                        ? RaisedButton(
                            onPressed: () {
                              print('Finish');
                              nexQuestion(_currentQuestion);
                              setState(() {
                                _finished = true;
                              });
                            },
                            child: Text('Finish'))
                        : RaisedButton(
                            onPressed: _answered
                                ? null
                                : () async {
                                    print('Next');
                                    var check = nexQuestion(_currentQuestion);
                                    setState(() {
                                      _answered = true;
                                      _correct = check;
                                    });
                                    await Future.delayed(
                                        const Duration(seconds: 2));
                                    setState(() {
                                      _currentQuestion = _currentQuestion + 1;
                                      _currentAnswer = -1;
                                      _answered = false;
                                      _correct = false;
                                      _currentQuestionID =
                                          trivia[_currentQuestion].id;
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
