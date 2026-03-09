import 'package:flutter/material.dart';
import 'package:project_structure_bloc/generated/l10n.dart';
import 'package:project_structure_bloc/plugin/CountryCodePicker/helpers.dart';
import 'package:project_structure_bloc/presentation/common/text/common_text.dart';
import 'package:project_structure_bloc/presentation/common/text_field/common_text_field.dart';
import 'package:project_structure_bloc/presentation/utils/app_colors.dart';
import 'package:project_structure_bloc/presentation/utils/app_constant.dart';
import 'package:project_structure_bloc/presentation/utils/size.dart';
import 'package:project_structure_bloc/presentation/utils/styles.dart';

import 'countries.dart';

class PickerDialogStyle {
  final Color? backgroundColor;

  final TextStyle? countryCodeStyle;

  final TextStyle? countryNameStyle;

  final Widget? listTileDivider;

  final EdgeInsets? listTilePadding;

  final EdgeInsets? padding;

  final Color? searchFieldCursorColor;

  final InputDecoration? searchFieldInputDecoration;

  final EdgeInsets? searchFieldPadding;

  final double? width;

  PickerDialogStyle({
    this.backgroundColor,
    this.countryCodeStyle,
    this.countryNameStyle,
    this.listTileDivider,
    this.listTilePadding,
    this.padding,
    this.searchFieldCursorColor,
    this.searchFieldInputDecoration,
    this.searchFieldPadding,
    this.width,
  });
}

class CountryPickerDialog extends StatefulWidget {
  final List<Country> countryList;
  final Country selectedCountry;
  final ValueChanged<Country> onCountryChanged;
  final String searchText;
  final List<Country> filteredCountries;
  final PickerDialogStyle? style;
  final String languageCode;

  const CountryPickerDialog({
    super.key,
    required this.searchText,
    required this.languageCode,
    required this.countryList,
    required this.onCountryChanged,
    required this.selectedCountry,
    required this.filteredCountries,
    this.style,
  });

  @override
  _CountryPickerDialogState createState() => _CountryPickerDialogState();
}

class _CountryPickerDialogState extends State<CountryPickerDialog> {
  late List<Country> _filteredCountries;
  late Country _selectedCountry;
  late TextEditingController _searchController;

  @override
  void initState() {
    _selectedCountry = widget.selectedCountry;
    _filteredCountries = widget.filteredCountries.toList()
      ..sort(
        (a, b) => a
            .localizedName(widget.languageCode)
            .compareTo(b.localizedName(widget.languageCode)),
      );
    _searchController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SizedBox(
        height: height * 0.75,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.medium,
          ).copyWith(top: Spacing.normal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CommonText(
                string: S.of(AppConstant.globalCtx).select_country_code,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),

              Padding(
                padding: EdgeInsets.only(
                  top: Spacing.medium,
                  bottom: Spacing.large,
                ),
                child: CommonTextField(
                  controller: _searchController,
                  fillColor: AppColors.backgroundColor,
                  hintText: S.of(AppConstant.globalCtx).search_here,
                  onChanged: (value) {
                    _filteredCountries = widget.countryList.stringSearch(value)
                      ..sort((a, b) {
                        return a
                            .localizedName(widget.languageCode)
                            .compareTo(b.localizedName(widget.languageCode));
                      });
                    if (mounted) setState(() {});
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _filteredCountries.length,
                  itemBuilder: (ctx, index) => Padding(
                    padding: EdgeInsets.only(bottom: Spacing.medium),
                    child: GestureDetector(
                      onTap: () {
                        _selectedCountry = _filteredCountries[index];
                        widget.onCountryChanged(_selectedCountry);
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Row(
                          children: <Widget>[
                            Text(
                              _filteredCountries[index].flag,
                              style: TextStyle(fontSize: Spacing.large),
                            ),
                            SizedBox(width: Spacing.small),
                            SizedBox(
                              width: width * 0.14,
                              child: Text(
                                '+${_filteredCountries[index].dialCode}',
                                style: AppTextStyle().commonTextStyle(
                                  appFontStyle: AppFontStyle.medium,
                                ),
                              ),
                            ),
                            Text(
                              _filteredCountries[index].localizedName(
                                widget.languageCode,
                              ),
                              style: AppTextStyle().commonTextStyle(
                                appFontStyle: AppFontStyle.medium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
