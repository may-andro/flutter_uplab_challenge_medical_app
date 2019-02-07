

import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  RoundedButton(
      {@required this.onPressed,
      @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      width: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: new BorderRadius.circular(30.0),
      ),
      child: InkWell(
          onTap: onPressed,
          child: Center(
            child: Text(text,
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(color: Colors.white)),
          )),
    );
  }
}
