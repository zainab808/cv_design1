// import 'package:flutter/material.dart';


// class SecondaryButton extends StatelessWidget {
//   var text,color,textColor;
//   SecondaryButton ({this.text,this.color,this.textColor});

//   @override
//   Widget build(BuildContext context) {
//     return   // Start white Button
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: color,
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 40, vertical: 16),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   onPressed: () {},
//                   child:  Text(
//                     text,
//                     style: TextStyle(
//                       color: textColor
//                       //  Color(0xFF512DA8)
//                        ,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 );
//   }
// }


















import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
  });

  // 🔹 Alert show karne ka function
  void _showAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Alert!',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // 🔸 Button background par press hone se kuch nahi hoga
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      // 🔸 Sirf text ke liye GestureDetector lagaya gaya hai
      child: GestureDetector(
        key: ValueKey('text_$text'),
        onTap: () => _showAlert(context, '$text pressed!'),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
