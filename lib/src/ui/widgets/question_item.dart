import 'package:flutter/material.dart';

import '../../models/question.dart';

class QuestionItem extends StatefulWidget {
  final Question question;
  final Function onSelect;
  final int selected;

  const QuestionItem({Key key, this.question, this.onSelect, this.selected})
      : super(key: key);

  @override
  _QuestionItemState createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.question.text,
            style: Theme.of(context).textTheme.headline6,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: widget.question.options.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    selected: widget.selected == index,
                    title: Text(widget.question.options[index]),
                    onTap: () {
                      widget.onSelect(index);
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
