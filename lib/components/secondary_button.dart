import 'package:flutter/material.dart';


class SecondaryButton extends StatelessWidget {
  var text,color,textColor;
  SecondaryButton ({this.text,this.color,this.textColor});

  @override
  Widget build(BuildContext context) {
    return   // Start white Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child:  Text(
                    text,
                    style: TextStyle(
                      color: textColor
                      //  Color(0xFF512DA8)
                       ,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
  }
}