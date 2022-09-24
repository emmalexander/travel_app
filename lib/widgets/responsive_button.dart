import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/normal_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool isResponsive;
  double? width;
  ResponsiveButton({Key? key, this.isResponsive = false, this.width = 120})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: isResponsive
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResponsive
                ? Container(
                    padding: EdgeInsets.only(left: 20),
                    child: NormalText(
                      text: 'Book Trip Now',
                      color: Colors.white,
                    ),
                  )
                : Container(),
            SizedBox(width: 10),
            Image.asset(
              'images/button-one.png',
            ),
          ],
        ),
      ),
    );
  }
}
