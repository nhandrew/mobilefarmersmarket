import 'package:farmers_market/src/styles/base.dart';
import 'package:farmers_market/src/styles/colors.dart';
import 'package:farmers_market/src/styles/text.dart';
import 'package:farmers_market/src/widgets/button.dart';
import 'package:farmers_market/src/widgets/dropdown_button.dart';
import 'package:farmers_market/src/widgets/sliver_scaffold.dart';
import 'package:farmers_market/src/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditProduct extends StatefulWidget {
  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return AppSliverScaffold.cupertinoSliverScaffold(
          navTitle: '', pageBody: pageBody(true), context: context);
    } else {
      return AppSliverScaffold.materialSliverScaffold(
          navTitle: '', pageBody: pageBody(false), context: context);
    }
  }

  Widget pageBody(bool isIOS) {
    List<String> items = List<String>();
    items.add('Pounds');
    items.add('Single');
    return ListView(
      children: <Widget>[
        Text(
          'Add Product',
          style: TextStyles.subtitle,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: BaseStyles.listPadding,
          child: Divider(color: AppColors.darkblue),
        ),
        AppTextField(
            hintText: 'Product Name',
            cupertinoIcon: FontAwesomeIcons.shoppingBasket,
            materialIcon: FontAwesomeIcons.shoppingBasket,
            isIOS: isIOS),
        AppDropdownButton(
          hintText: 'Unit Type',
          items: items,
          materialIcon: FontAwesomeIcons.balanceScale,
          cupertinoIcon: FontAwesomeIcons.balanceScale,
        ),
        AppTextField(
            hintText: 'Unit Price',
            cupertinoIcon: FontAwesomeIcons.tag,
            materialIcon: FontAwesomeIcons.tag,
            isIOS: isIOS),
        AppTextField(
            hintText: 'Available Units',
            cupertinoIcon: FontAwesomeIcons.hashtag,
            materialIcon: FontAwesomeIcons.hashtag,
            isIOS: isIOS),
        AppButton(buttonType: ButtonType.Straw, buttonText: 'Add Image'),
        AppButton(
          buttonType: ButtonType.DarkBlue,
          buttonText: 'Save Product',
        ),
      ],
    );
  }
}
