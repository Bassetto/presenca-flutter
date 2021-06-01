import 'package:flutter/material.dart';
import 'package:presenca/app/core/app_colors.dart';
import 'package:presenca/app/core/app_images.dart';
import 'package:presenca/app/core/app_text_styles.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({Key key, this.scaffoldKey}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Size get preferredSize => Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    final double phoneWidth = MediaQuery.of(context).size.width;

    return Container(
      height: preferredSize.height,
      width: phoneWidth,
      decoration: BoxDecoration(color: Colors.transparent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: TextDirection.ltr,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          OutlinedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
              side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
            ),
            child: Icon(
              Icons.menu,
              color: AppColors.rosaFiap,
            ),
            onPressed: () => scaffoldKey.currentState.openDrawer(),
          ),
          Container(
            // alignment: Alignment.center,
            padding: EdgeInsets.only(right: 20),
            width: phoneWidth * 0.4,
            child: Image.asset(
              AppImages.logo,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

// class AppBarWidget extends PreferredSize {
//   AppBarWidget()
//       : super(
//     preferredSize: Size.fromHeight(150),
//     child: Container(
//       height: 150,
//       child: Container(
//         height: 150,
//         width: double.maxFinite,
//         decoration: BoxDecoration(color: Colors.deepPurple.shade900),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: Image.asset(
//                 AppImages.logo,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 20),
//               child: Text(
//                 "Professor(a) Flávio Moreni",
//                 style: AppTextStyles.title,
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
