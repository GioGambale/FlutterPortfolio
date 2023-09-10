import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../provider/home.dart';
import '../../../provider/theme.dart';
import '../../../utils/constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: MyThemes.darkTheme.scaffoldBackgroundColor,
      child: SingleChildScrollView(
        child: Consumer(builder: (context, ref, _) {
          return Wrap(
              direction: Axis.vertical,
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              children: AppConstants.headerItems
                  .map(
                    (item) => MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 30),
                        child: GestureDetector(
                          onTap: () {
                            item.onTap();
                            HomeProvider _homeProvider =
                                ref.read(homeProvider);
                            _homeProvider.scrollBasedOnHeader(item);
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            item.title,
                            style: const TextStyle(
                              color: null,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList());
        }),
      ),
    );
  }
}
