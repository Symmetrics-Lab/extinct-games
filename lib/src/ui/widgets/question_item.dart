import 'package:flutter/material.dart';

import '../../models/question.dart';

class QuestionItem extends StatefulWidget {
  final Question question;
  final Function onSelect;

  const QuestionItem({Key key, this.question, this.onSelect}) : super(key: key);

  @override
  _QuestionItemState createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  var _selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Text(widget.question.text),
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          child: ListView.builder(
              itemCount: widget.question.options.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  selected: _selected == index,
                  title: Text(widget.question.options[index]),
                  onTap: () {
                    widget.onSelect(index);
                    setState(() {
                      _selected = index;
                    });
                  },
                );
              }),
        )
      ],
    );
  }
}
