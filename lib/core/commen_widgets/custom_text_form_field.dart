import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.textEditingController,
    this.keyboardType,
    this.onChanged,
    this.onTap,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.focusNode,
    required this.labelText,
    required this.hintText,
    this.suffixIcon,
    this.contentPadding,
    this.icon,
    this.obscureText = false,
    this.readOnly = false,
    this.inputFormatters,
    this.textFieldName = '',
    this.maxLines = 1,
    this.initialValue = '',
    this.autoFocus = false,
  });

  final TextEditingController textEditingController;
  final TextInputType? keyboardType;
  final Function(String?)? onChanged;
  final GestureTapCallback? onTap;
  final ValueChanged<String?>? onFieldSubmitted;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final String labelText;
  final String hintText;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final bool obscureText;
  final Widget? icon;
  final bool readOnly;
  final List? inputFormatters;
  final String textFieldName;
  final int maxLines;
  final String? initialValue;
  final bool? autoFocus;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            Text(
              labelText,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.black45,
                  ),
            ),
            icon ?? Container(),
          ],
        ),
        Container(
          width: 343.w,
          alignment: Alignment.center,
          child: FormBuilderTextField(
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            maxLines: maxLines,
            name: textFieldName,
            inputFormatters: const [],
            readOnly: readOnly,
            obscureText: obscureText,
            controller: textEditingController,
            focusNode: focusNode,
            onChanged: onChanged,
            onTap: onTap,
            onSubmitted: onFieldSubmitted,
            validator: validator,
            onSaved: onSaved,
            keyboardType: keyboardType,
            autofocus: autoFocus ?? false,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: Colors.grey, fontSize: 12.sp),
              suffixIcon: suffixIcon,
              contentPadding: contentPadding,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0.r),
                borderSide: const BorderSide(color: Colors.grey
                    // color: ColorConstants.textFromFieldBorderColor,
                    ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0.r),
                borderSide: const BorderSide(color: Colors.grey
                    // color: ColorConstants.textFromFieldBorderColor,
                    ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0.r),
                borderSide: const BorderSide(color: Colors.red
                    // color: ColorConstants.secondaryColor,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
