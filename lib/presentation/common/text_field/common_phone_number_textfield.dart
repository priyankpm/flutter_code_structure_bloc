import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_structure_bloc/plugin/CountryCodePicker/countries.dart';
import 'package:project_structure_bloc/plugin/CountryCodePicker/intl_phone_field.dart';
import 'package:project_structure_bloc/plugin/CountryCodePicker/phone_number.dart';
import 'package:project_structure_bloc/presentation/common/error_view/error_text_widget.dart';
import 'package:project_structure_bloc/presentation/common/text/common_text.dart';
import 'package:project_structure_bloc/presentation/utils/app_colors.dart';
import 'package:project_structure_bloc/presentation/utils/size.dart';
import 'package:project_structure_bloc/presentation/utils/styles.dart';

typedef BlocPhoneGetter<State> = PhoneNumber Function(State state);
typedef BlocPhoneSetter = void Function(PhoneNumber value);

class BlocCommonPhoneNumberTextField<B extends BlocBase<BState>, BState>
    extends StatefulWidget {
  final BlocPhoneGetter<BState> getValue;
  final BlocPhoneSetter onChanged;
  final String hintText;
  final String? labelText;
  final String? errorMessage;

  const BlocCommonPhoneNumberTextField({
    super.key,
    required this.getValue,
    required this.onChanged,
    required this.hintText,
    this.labelText,
    this.errorMessage,
  });

  @override
  State<BlocCommonPhoneNumberTextField<B, BState>> createState() =>
      _BlocCommonPhoneNumberTextFieldState<B, BState>();
}

class _BlocCommonPhoneNumberTextFieldState<B extends BlocBase<BState>, BState>
    extends State<BlocCommonPhoneNumberTextField<B, BState>> {
  late final TextEditingController _controller;
  late PhoneNumber _initialPhoneNumber;

  @override
  void initState() {
    super.initState();
    final bloc = context.read<B>();
    final state = bloc.state;
    _initialPhoneNumber = widget.getValue(state);
    _controller = TextEditingController(text: _initialPhoneNumber.number);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateControllerText(PhoneNumber number) {
    if (_controller.text != number.number) {
      _controller.text = number.number;
      _controller.selection = TextSelection.collapsed(
        offset: number.number.length,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<B, BState>(
      listenWhen: (prev, curr) =>
          widget.getValue(prev).number != widget.getValue(curr).number ||
          widget.getValue(prev).countryCode !=
              widget.getValue(curr).countryCode,
      listener: (context, state) {
        final newPhone = widget.getValue(state);
        _updateControllerText(newPhone);
      },
      child: CommonPhoneNumberTextField(
        labelText: widget.labelText,
        hintText: widget.hintText,
        controller: _controller,
        countryCode: _initialPhoneNumber.countryISOCode,
        errorMessage: widget.errorMessage,
        onChanged: (phone) {
          _updateControllerText(phone);
          widget.onChanged(phone);
        },
        onCountryChanged: (country) {
          final phone = PhoneNumber(
            countryISOCode: country.code,
            countryCode: '+${country.dialCode}',
            number: _controller.text,
          );
          widget.onChanged(phone);
        },
      ),
    );
  }
}

class CommonPhoneNumberTextField extends StatelessWidget {
  final String hintText;
  final String? countryCode;
  final TextEditingController? controller;
  final void Function(PhoneNumber)? onChanged;
  final void Function(Country)? onCountryChanged;
  final String? labelText;
  final String? errorMessage;
  final Color? fillColor;

  const CommonPhoneNumberTextField({
    super.key,
    required this.hintText,
    this.onChanged,
    this.onCountryChanged,
    this.controller,
    this.countryCode,
    this.labelText,
    this.errorMessage,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (labelText != null && (labelText?.isNotEmpty ?? false))
          Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: CommonText(
              string: labelText ?? "",
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: AppColors.textPrimaryColor,
            ),
          ),
        IntrinsicHeight(
          child: IntlPhoneField(
            controller: controller,
            showDropdownIcon: false,
            cursorColor: AppColors.textPrimaryColor,
            cursorHeight: 20,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              isDense: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: Colors.transparent, width: 0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: Colors.transparent, width: 0),
              ),
              fillColor: fillColor ?? AppColors.cardBgColor,
              filled: true,
              hintText: hintText,
              counterText: '',
              hintStyle: AppTextStyle().commonTextStyle(
                textColor: AppColors.textPrimaryColor,
                fontSize: 13,
                appFontStyle: AppFontStyle.medium,
              ),
              contentPadding: EdgeInsets.only(
                right: Spacing.medium,
                top: Spacing.normal,
                bottom: Spacing.normal,
              ),
            ),
            initialCountryCode: countryCode ?? 'IN',
            flagsButtonPadding: EdgeInsets.only(left: Spacing.small),
            disableLengthCheck: true,
            invalidNumberMessage: '',
            dropdownTextStyle: AppTextStyle().commonTextStyle(
              fontSize: 14,
              appFontStyle: AppFontStyle.medium,
            ),
            style: AppTextStyle().commonTextStyle(
              fontSize: 14,
              appFontStyle: AppFontStyle.medium,
            ),
            onChanged: onChanged,
            onCountryChanged: onCountryChanged,
          ),
        ),
        if (errorMessage != null && (errorMessage?.isNotEmpty ?? false))
          Padding(
            padding: EdgeInsets.only(top: Spacing.small),
            child: ErrorTextWidget(errorMessage: errorMessage),
          ),
      ],
    );
  }
}
