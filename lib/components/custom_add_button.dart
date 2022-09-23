import 'package:flutter/material.dart';

import '../theme/decorations.dart';

class CustomAddButton extends StatelessWidget {
  const CustomAddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [Decorations.buildShadow(Offset(-1, 2))]
          ),
          child: const SizedBox(width: 47, height: 47),
          ),

        IconButton(
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.add, size: 30, color: Colors.green,),
          onPressed: (){},

        )
      ],
    );
  }
}
