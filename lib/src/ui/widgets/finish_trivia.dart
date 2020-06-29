import 'package:flutter/material.dart';

class FinishTrivia extends StatelessWidget {
  final int score;
  final int count;
  final Function tryAgain;

  const FinishTrivia({Key key, this.score, this.count, this.tryAgain})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 400,
            child: CircleAvatar(
              radius: 70,
              child: ClipOval(
                child: score >= count / 2
                    ? Image.asset('assets/monkey1.jpg')
                    : Image.asset('assets/monkey2.jpg'),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text('Your score is ${score}/${count}',
              style: Theme.of(context).textTheme.headline3),
          Text(score >= count / 2 ? 'Congratulations' : 'So close! Try again',
              style: Theme.of(context).textTheme.headline4),
          RaisedButton(
            onPressed: () {
              tryAgain();
            },
            child: Text('Try again!'),
          )
        ],
      ),
    );
  }
}
