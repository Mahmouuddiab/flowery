import 'package:flutter/material.dart';

class CustomRowText extends StatelessWidget {
  String textOne;
  String textTwo;
   CustomRowText({super.key,required this.textOne,required this.textTwo});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(textOne,style: Theme.of(context).textTheme.titleMedium,),
        Text(textTwo,style: Theme.of(context).textTheme.titleSmall,)
      ],
    );
  }
}
