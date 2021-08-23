import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyperbike/utils/constant_util.dart';

class AlertDialogCustom {
  Future<void> alertDialog(BuildContext context, String text, String? desc,
      {IconData icon = Icons.warning,
      Color colorIcon = ConstantsUtil.cIndigo,
      bool isNavigate = false,
      navigate,
      isOneButton = false,
      String imgAsset = "",
      String? roomId,
      Function? onPressedOK,
      bool noButton = false,
      Widget? customWidget,
      bool isDismissable = true}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: isDismissable, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                SizedBox(height: 30),
                Text(
                  text,
                  style: GoogleFonts.rubik(
                      fontSize: 20, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: imgAsset != ""
                      ? Image.asset(
                          imgAsset,
                          height: 70,
                        )
                      : Icon(
                          icon,
                          color: colorIcon,
                          size: 70,
                        ),
                ),
                SizedBox(height: 20),
                customWidget == null
                    ? Text(desc!,
                    style: GoogleFonts.rubik(
                        fontSize: 16, color: Color.fromRGBO(150, 150, 150, 1)), textAlign: TextAlign.center)
                    : customWidget,
                SizedBox(height: 30),
                // noButton == false
                //     ? isOneButton
                //         ? defaultButton(context, 'OK', onPress: onPressedOK)
                //         : Container(
                //             height: 36,
                //             child: Row(
                //               crossAxisAlignment: CrossAxisAlignment.stretch,
                //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //               children: <Widget>[
                //                 FlatButton(
                //                     color: Colors.white,
                //                     shape: OutlineInputBorder(
                //                       borderSide: BorderSide(
                //                           color: SwatchColor.kLightBlueGreen),
                //                       borderRadius:
                //                           new BorderRadius.circular(8),
                //                     ),
                //                     child: dynamicText('TIDAK',
                //                         color: SwatchColor.kLightBlueGreen,
                //                         fontSize: 16),
                //                     onPressed: () {
                //                       Navigator.pop(context);
                //                     }),
                //                 defaultButton(context, 'YA',
                //                     onPress: onPressedOK)
                //               ],
                //             ))
                //     : Container(),
              ],
            ),
          ),
        );
      },
    );
  }
}
