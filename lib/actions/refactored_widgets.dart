import 'package:flutter/material.dart';

Widget appbarActionsRow({required Function() onTap}){
  return     Row(
    children: [
      IconButton(
        onPressed: onTap,
        icon: const Icon(Icons.search,
            size: 26, color: Colors.white),
      ),
      const SizedBox(
        width: 15,
      ),
      SizedBox(
        width: 20,
        height: 20,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: Image.network(
            "https://encrypted-"
                "tbn0.gstatic.com/images?q=tbn:"
                "ANd9GcQa6mnkESGGXpL32uVzQNDLcs"
                "AidQyxUkjADA&usqp=CAU",
            scale: 9,
          ),
        ),
      ),
      const SizedBox(
        width: 15,
      ),
    ],
  );
}
// Widget text({
//   required String values,
//   double size = 15,
//   Color color = Colors.black,
//   FontWeight weight = FontWeight.normal
// }){
//   return Text(values,style: TextStyle(fontSize: size,fontWeight: weight,color: color),);
// }

Widget divider({required double height,required double width}){
  return SizedBox(height: height,width: width,);
}

Widget text(
    {required String text,
      FontWeight fontWeight = FontWeight.normal,
      double fontSize = 13,
      Color color = Colors.white}) {
  return Text(
    text,
    style:
    TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
  );
}

Widget iconAndNameColumn({required Icon icon, required String iconText,
  Color textColor =Colors.white,
  double fontSize =12}) {
  return Column(
    children: [
      icon,
      text(text: iconText, fontSize: fontSize, color: textColor),
    ],
  );
}
