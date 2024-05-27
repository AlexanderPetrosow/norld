import "package:bounce/bounce.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:norld/global/colors.dart";

class MainBtn extends StatelessWidget {
  const MainBtn({
    super.key,
    this.callback,
    this.text = '',
    this.sw = 1,
    this.sh = 0.075,
    this.block = false,
    this.fontsize
  });

  final Function()? callback;
  final String text;
  final double sw;
  final double sh;
  final bool block;
  final double? fontsize;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Bounce(
      onTap: callback,
      child: SizedBox(
        width: w * sw,
        height: h * sh,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            // SvgPicture.asset(
            //   'assets/images/btn.svg',
            //   fit: BoxFit.fill,
            // ),
            SizedBox(
              height: h * sw,
              width: w,
              child: SvgPicture.asset(
                'assets/images/btn.svg',
                fit: BoxFit.fill,
                colorFilter: block
                    ? ColorFilter.mode(grey, BlendMode.modulate)
                    : const ColorFilter.srgbToLinearGamma(),
              ),
            ),
            Text(
              text,
              style: TextStyle(color: white, fontSize: fontsize ?? w * 0.04),
            ),
          ],
        ),
      ),
      // child: Container(
      //   color: red,
      //   height: h * 0.1,
      //   width: w * 0.9,
      //   child: SvgPicture.asset(
      //     'assets/images/btn.svg',
      //     fit: BoxFit.fill,
      //   ),
      // ),
    );
  }
}
