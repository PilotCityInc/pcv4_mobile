import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv4_mobile/application/auth/auth_bloc.dart';
import 'package:pcv4_mobile/presentation/common/text_styling/palette.dart';
import 'package:pcv4_mobile/presentation/pages/auth/widgets/widgets.dart';

class EmployerIDForm extends StatelessWidget {
  const EmployerIDForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //align text
          children: [
            const SizedBox(
              //for spacing
              height: 100,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                //title
                'Employer ID',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: AutofillGroup(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    //text fields for employer
                    InputField(
                      hintString: 'Company/Organization',
                      multipleLines: 1,
                    ),
                    InputField(
                      hintString: 'Job Title',
                      multipleLines: 1,
                    ),
                    //multiline text fields
                    InputField(
                      hintString: 'Describe your industry',
                      multipleLines: 5,
                    ),
                    InputField(
                      hintString: 'Describe your primary product or service',
                      multipleLines: 5,
                    ),
                    InputField(
                      hintString: 'Search Employer Address',
                      multipleLines: 1,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: SizedBox(
                child: TextButton(
                  //save button
                  style: TextButton.styleFrom(
                    primary: Colors.grey,
                    backgroundColor: Colors.grey[300],
                    textStyle: const TextStyle(fontFamily: 'Raleway'),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'SAVE',
                  ),
                ),
                width: double.infinity,
                height: 40,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  //for input fields
  const InputField({
    Key? key,
    required this.hintString, //user prompt
    required this.multipleLines, //number of lines for field
  }) : super(key: key);

  final String hintString;
  final int multipleLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: TextFormField(
        style: const TextStyle(fontFamily: 'Raleway'), //set font
        maxLines: multipleLines, //set number of lines
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey), //border on select
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey), //border color
          ),
          labelText: hintString, //user hint
          labelStyle: const TextStyle(
            fontFamily: 'Raleway',
          ),
          alignLabelWithHint: true, //set hint text to top of multiline field
          floatingLabelStyle: const TextStyle(
              color: Colors.grey), //change color of focused text
        ),
      ),
    );
  }
}
