import 'package:farmers_market/src/blocs/product_bloc.dart';
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
import 'package:provider/provider.dart';

class EditProduct extends StatefulWidget {
  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  @override
  Widget build(BuildContext context) {
    var productBloc = Provider.of<ProductBloc>(context);

    if (Platform.isIOS) {
      return AppSliverScaffold.cupertinoSliverScaffold(
          navTitle: '', pageBody: pageBody(true,productBloc), context: context);
    } else {
      return AppSliverScaffold.materialSliverScaffold(
          navTitle: '', pageBody: pageBody(false,productBloc), context: context);
    }
  }

  Widget pageBody(bool isIOS, ProductBloc productBloc) {
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
        StreamBuilder<String>(
          stream: productBloc.productName,
          builder: (context, snapshot) {
            return AppTextField(
                hintText: 'Product Name',
                cupertinoIcon: FontAwesomeIcons.shoppingBasket,
                materialIcon: FontAwesomeIcons.shoppingBasket,
                isIOS: isIOS,
                errorText: snapshot.error,
                onChanged: productBloc.changeProductName,
                );
          }
        ),
        AppDropdownButton(
          hintText: 'Unit Type',
          items: items,
          materialIcon: FontAwesomeIcons.balanceScale,
          cupertinoIcon: FontAwesomeIcons.balanceScale,
        ),
        StreamBuilder<double>(
          stream: productBloc.unitPrice,
          builder: (context, snapshot) {
            return AppTextField(
                hintText: 'Unit Price',
                cupertinoIcon: FontAwesomeIcons.tag,
                materialIcon: FontAwesomeIcons.tag,
                isIOS: isIOS,
                textInputType: TextInputType.number,
                errorText: snapshot.error,
                onChanged: productBloc.changeUnitPrice,
                );
          }
        ),
        StreamBuilder<int>(
          stream: productBloc.availableUnits,
          builder: (context, snapshot) {
            return AppTextField(
                hintText: 'Available Units',
                cupertinoIcon: FontAwesomeIcons.cubes,
                materialIcon: FontAwesomeIcons.cubes,
                isIOS: isIOS,
                textInputType: TextInputType.number,
                errorText: snapshot.error,
                onChanged: productBloc.changeAvailableUnits,
                );
          }
        ),
        AppButton(buttonType: ButtonType.Straw, buttonText: 'Add Image'),
        AppButton(
          buttonType: ButtonType.DarkBlue,
          buttonText: 'Save Product',
        ),
      ],
    );
  }
}
