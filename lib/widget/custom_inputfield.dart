import 'package:bjs_assessment/shared/resources/app_colors.dart';
import 'package:bjs_assessment/widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField(
      {super.key,
      required this.title,
      required this.hint,
      required this.textInputType,
      required this.textEditingController,
      required this.focusNode,
      required this.userCallBack, required this.validator});

  final String title;
  final String hint;
  final TextInputType textInputType;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final void Function() userCallBack;
  final String? Function(String?) validator;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        customText(
          text: widget.title,
          textStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: widget.textEditingController,
          focusNode: widget.focusNode,
          maxLines: 1,
          readOnly: false,
          showCursor: true,
          autofocus: true,
          keyboardType: widget.textInputType,
          clipBehavior: Clip.antiAlias,
          cursorColor: AppColors.blackColor,
          textAlign: TextAlign.left,
          textAlignVertical: TextAlignVertical.center,
          scrollPhysics: const NeverScrollableScrollPhysics(),
          style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: AppColors.blackColor),
          maxLength: 30,
          decoration: InputDecoration(
              fillColor: AppColors.whiteColor,
              counterText: '',
              hintMaxLines: 1,
              hintText: widget.hint,
              hintStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: AppColors.blackColor.withOpacity(0.5)),
              filled: true,
              isDense: false,
              border: customOutlineInputBorder(isError: false),
              enabledBorder: customOutlineInputBorder(isError: false),
              disabledBorder: customOutlineInputBorder(isError: false),
              focusedBorder: customOutlineInputBorder(isError: false),
              errorBorder: customOutlineInputBorder(isError: true),
              focusedErrorBorder: customOutlineInputBorder(isError: true),
              errorStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: AppColors.blackColor.withOpacity(0.5)),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              isCollapsed: true),
          validator: widget.validator,
          onFieldSubmitted: (value) => widget.userCallBack(),
          onChanged: (value) => widget.userCallBack(),
          onSaved: (value) => widget.userCallBack(),
          onTapOutside: (value) => widget.focusNode.unfocus(),
        ),
      ],
    );
  }

  OutlineInputBorder customOutlineInputBorder({required bool isError}) {
    return OutlineInputBorder(
        gapPadding: 0.0,
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
            color:
                isError ? AppColors.errorColor : AppColors.transparentColor));
  }
}
