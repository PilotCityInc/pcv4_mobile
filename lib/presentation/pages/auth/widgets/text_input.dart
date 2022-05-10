import 'package:flutter/material.dart';
import 'package:pcv4_mobile/presentation/pages/auth/widgets/palette.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.prompt,
    required this.inputType,
    required this.inputAction,
    required this.autocorrect,
    required this.autofillHints,
    required this.onChanged,
    required this.validator,
  }) : super(key: key);

  final String prompt;
  final TextInputType inputType;
  final TextInputAction inputAction;

  final bool autocorrect;
  final Iterable<String> autofillHints;
  final void Function(String) onChanged;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              prompt.toUpperCase(),
              textAlign: TextAlign.left,
              style: inputPrompt,
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              hintStyle: body,
            ),
            style: input,
            keyboardType: inputType,
            textInputAction: inputAction,
            autocorrect: autocorrect,
            autofillHints: autofillHints,
            onChanged: onChanged,
            validator: validator,
          ),
        ],
      ),
    );
  }
}

// class TextInput extends StatelessWidget {
//   const TextInput({
//     Key? key,
//     required this.icon,
//     required this.prompt,
//     required this.inputType,
//     required this.inputAction,
//   }) : super(key: key);
//
//   final IconData icon;
//   final String prompt;
//   final TextInputType inputType;
//   final TextInputAction inputAction;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.grey[600]?.withOpacity(0.5),
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: TextField(
//           decoration: InputDecoration(
//             contentPadding: EdgeInsets.symmetric(vertical: 15),
//             border: InputBorder.none,
//             prefixIcon: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Icon(
//                 icon,
//                 color: Colors.white,
//                 size: 30,
//               ),
//             ),
//             hintText: prompt,
//             hintStyle: body,
//           ),
//           style: body,
//           keyboardType: inputType,
//           textInputAction: inputAction,
//         ),
//       ),
//     );
//   }
// }
