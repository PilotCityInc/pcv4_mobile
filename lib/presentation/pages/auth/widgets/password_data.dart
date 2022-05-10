import 'package:flutter/material.dart';
import 'package:pcv4_mobile/presentation/pages/auth/widgets/palette.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    Key? key,
    required this.prompt,
    required this.inputAction,
    required this.autofillHints,
    required this.onChanged,
    required this.validator,
  }) : super(key: key);

  final String prompt;
  final TextInputAction inputAction;

  final Iterable<String> autofillHints;
  final void Function(String) onChanged;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          prompt,
          style: inputPrompt,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        TextFormField(
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1.0)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.0),
            ),
          ),
          style: input,
          obscureText: true,
          obscuringCharacter: '*',
          textInputAction: inputAction,
          autofillHints: autofillHints,
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    );
  }
}

// child: TextField(
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
//           ),
//           style: body,
//           obscureText: true,
//           textInputAction: inputAction,
//         ),
