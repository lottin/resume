import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/icon_park_outline.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:shimmer/shimmer.dart';

import 'cv_provider.dart';

class EditCV extends StatelessWidget {
   EditCV({Key? key, required this.cvProvider}) : super(key: key);
   final CVProvider cvProvider;
  void saveInformation(BuildContext context) {

    String fullName = cvProvider.fullName;
    String bio = cvProvider.bio;
    String slack = cvProvider.slack;
    String github = cvProvider.github;

    if (fullNameController.text.isNotEmpty) {
      fullName = fullNameController.text;
    }
    if (bioController.text.isNotEmpty) {
      bio = bioController.text;
    }
    if (slackController.text.isNotEmpty) {
      slack = slackController.text;
    }
    if (githubController.text.isNotEmpty) {
      github = githubController.text;
    }

    cvProvider.updateCVInformation(
      fullName: fullName,
      bio: bio,
      slack: slack,
      github: github,
    );

    AnimatedSnackBar.material(
      'CV edited successfully',
      type: AnimatedSnackBarType.success,
    ).show(context);

    Navigator.pop(context);
  }

  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController bioController = TextEditingController();

  final TextEditingController slackController = TextEditingController();

  final TextEditingController githubController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit CV'),
        elevation: 0,
        actions: [
          InkWell(
            onTap: () {
              bool allFieldsEmpty = fullNameController.text.isEmpty &&
                  bioController.text.isEmpty &&
                  slackController.text.isEmpty &&
                  githubController.text.isEmpty;

              if (allFieldsEmpty) {
                AnimatedSnackBar.material(
                  'Nothing to save!',
                  type: AnimatedSnackBarType.error,
                ).show(context);
              } else {
                saveInformation(context);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Shimmer.fromColors(
                baseColor: Colors.blueGrey.shade900,
                highlightColor: Colors.white,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      side: BorderSide(),
                    ),
                  ),
                  child: const Text('Save'),
                ),
              ),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus(); // Dismiss the keyboard
        },
          child: Column(
            children: [
              buildTextField(
                fullNameController,
                2,
                IconParkOutline.edit_name,
                'Full name',
              ),
              buildTextField(
                bioController,
                5,
                Mdi.about_variant,
                'Bio...brief description about yourself',
              ),
              buildTextField(
                slackController,
                1,
                Mdi.slack,
                'Slack username',
              ),
              buildTextField(
                githubController,
                1,
                Mdi.github,
                'Github handle',
              ),
            ],
          ),
        ),
    );
  }

  Container buildTextField(
      TextEditingController controller,
      int maxLines,
      String icon,
      String hint,
      ) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 16),
      child: TextFormField(
        controller: controller,
        minLines: 1,
        maxLines: maxLines,
        decoration: InputDecoration(
          prefixIconConstraints: const BoxConstraints(maxWidth: 48, maxHeight: 48),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Iconify(
              icon,
              color: Colors.blueGrey,
            ),
          ),
          prefix: controller == githubController ? const Text('@') : null,
          hintText: hint,
          enabledBorder: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.blueGrey),
          ),
        ),
      ),
    );
  }

}