import 'package:bjs_assessment/shared/resources/app_colors.dart';
import 'package:bjs_assessment/shared/resources/assets_path.dart';
import 'package:bjs_assessment/view/user_profile/user_profile.dart';
import 'package:bjs_assessment/widget/custom_button.dart';
import 'package:bjs_assessment/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/user_profile_provider.dart';
import '../../data/local/local_request.dart';
import '../../shared/utils/regular_expression.dart';
import '../../widget/custom_inputfield.dart';
import '../../widget/gender_selection_dropdown.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _userNameTextController = TextEditingController();
  final FocusNode _userNameFocusNode = FocusNode();
  final TextEditingController _userEmailTextController =
      TextEditingController();
  final FocusNode _userEmailFocusNode = FocusNode();
  final TextEditingController _dobTextController = TextEditingController();
  final FocusNode _dobFocusNode = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProfileProvider>(
        builder: (context, userProfileProvider, child) {
      return Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          title: customText(
            text: (LocalRequest.instance.getString(key: LocalRequest.userInfoKey).isNotEmpty)  ? "Edit Profile" : "Create Profile",
            textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor),
          ),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                //region name section
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: AppColors.profileGradientColor)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(AssetsPath.splashLogo),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            customText(
                                text: userProfileProvider.userProfileModel?.username ?? "",
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: AppColors.blackColor),
                                textAlign: TextAlign.start),
                            customText(
                                text: "Developer",
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18,
                                    color:
                                        AppColors.blackColor.withOpacity(0.5)),
                                textAlign: TextAlign.start)
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
                //endregion
                //region info input section
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomInputField(
                        title: 'User Name',
                        hint: 'xyz',
                        textInputType: TextInputType.name,
                        textEditingController: _userNameTextController,
                        focusNode: _userNameFocusNode,
                        userCallBack: () {
                          userProfileProvider.setUserName(
                              value: _userNameTextController.text.trim());
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomInputField(
                        title: 'Email',
                        hint: 'xyz@gmail.com',
                        textInputType: TextInputType.emailAddress,
                        textEditingController: _userEmailTextController,
                        focusNode: _userEmailFocusNode,
                        userCallBack: () {

                          userProfileProvider.setUserEmail(
                              value: _userEmailTextController.text.trim());
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          }
                          if (!AppRegularExpression.emailRegex
                              .hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Expanded(child: GenderSelectionDropdown()),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: CustomInputField(
                              title: 'Dob',
                              hint: 'dd/mm/yy',
                              textInputType: TextInputType.datetime,
                              textEditingController: _dobTextController,
                              focusNode: _dobFocusNode,
                              userCallBack: () {
                                userProfileProvider.setDob(
                                    value: _dobTextController.text.trim());
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your date of birth';
                                }
                                if (!AppRegularExpression.dateRegex
                                    .hasMatch(value)) {
                                  return 'Please enter a valid date of birth in the format dd/mm/yyyy';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 42,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: (LocalRequest.instance.getString(key: LocalRequest.userInfoKey).isNotEmpty),
                            child: Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    userProfileProvider.getSavedUserProfile();
                                    Navigator.of(context).pop();
                                  },
                                  child: customButton(
                                      text: "Cancel", isActive: false),
                                )),
                          ),
                          const SizedBox(width: 8,),
                          Expanded(
                              child:
                                  GestureDetector(
                                      onTap: ()  {
                                        if(_formKey.currentState!.validate()) {
                                          userProfileProvider.saveUserProfile();
                                          Navigator.of(context).pushAndRemoveUntil(
                                              MaterialPageRoute(builder: (context) => const UserProfile()),(Route<dynamic> route) => false);
                                        }
                                      },
                                      child: customButton(text: "Save", isActive: true))),
                        ],
                      )
                    ],
                  ),
                ),
                //endregion
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _userNameTextController.dispose();
    _userEmailTextController.dispose();
    _dobTextController.dispose();
    _userNameFocusNode.dispose();
    _userEmailFocusNode.dispose();
    _dobFocusNode.dispose();
    super.dispose();
  }
}
