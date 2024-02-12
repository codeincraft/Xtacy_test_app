import 'package:estacy/constants/app_colors.dart';
import 'package:flutter/material.dart';

class EstacyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? sideTitle;
  final Widget? sideIcon;
  final Widget? leading;
  final Widget? titleWidget;
  final bool showActionIcon;
  final bool showActionBar;
  final VoidCallback? onMenuActionTap;
  final VoidCallback? onSideWidget1;
  final VoidCallback? onSideWidget2;
  const EstacyAppBar({
    Key? key,
    this.title = '',
    this.sideTitle,
    this.leading,
    this.titleWidget,
    this.onMenuActionTap,
    this.onSideWidget1,
    this.onSideWidget2,
    this.sideIcon,
    this.showActionIcon = false,
    this.showActionBar = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        // vertical: 40 ,
      ),
      child: Stack(children: [
        Positioned.fill(
            child: titleWidget == null
                ? Center(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: AppColor.textColor,
                      ),
                    ),
                  )
                : Center(
                    child: titleWidget!,
                  )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leading ??
                Transform.translate(
                  offset: const Offset(-14, 0),
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      }, child: Icon(Icons.arrow_back)),
                ),
                Expanded(child: Container()),
            if (showActionIcon)
              Transform.translate(
                offset: Offset(10, 0),
                child: InkWell(
                  onTap: onSideWidget1,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: sideIcon 
                    // ?? Icon(Icons.notifications_active_outlined),
                  ),
                ),
              ),
              if(showActionBar)
              Transform.translate(offset: Offset(10,0),
              child: InkWell(
                onTap: onSideWidget2,
                child: Padding(padding: const EdgeInsets.only(bottom: 0, right:10, left: 0, ),
                child: sideTitle,
                ),
              ),)
          ],
        )
      ]),
    ));
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 50);
}
