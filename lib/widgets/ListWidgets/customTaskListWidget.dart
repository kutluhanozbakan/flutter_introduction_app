// ignore_for_file:file_names, prefer_const_constructors_in_immutables,prefer_const_constructors,prefer_const_literals_to_create_immutables,use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_introduction_app_ard_grup/utils/themes.dart';

import '../../utils/utils.dart';

class TaskListWidget extends StatelessWidget {
  final String? title, extraTitle, taskNo, subTitle, trailing;
  final Color? importanceLevelColor;

  final VoidCallback? press;
  final bool isIcon;
  final VoidCallback? iconOnPressed;
  const TaskListWidget(
      {Key? key,
      this.title,
      this.extraTitle,
      this.taskNo,
      this.subTitle,
      this.trailing,
      this.press,
      this.importanceLevelColor,
      this.isIcon = false,
      this.iconOnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: press,
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x19025273),
              blurRadius: 12,
              offset: Offset(6, 8),
            ),
          ],
          color: Color(0xfff6f6f6),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 0, left: 0, right: 12, bottom: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Column(
                  children: [
                    Container(
                      color: importanceLevelColor!,
                      width: MediaQuery.of(context).size.width / 50,
                      height: MediaQuery.of(context).size.height / 12,
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: SizedBox(
                      width: size.width / 2.0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          title.toString(),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0xff025273),
                            fontSize: 14,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  subTitle.toString() != "" ? SizedBox(height: 3) : Container(),
                  subTitle.toString() != ""
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            subTitle.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Color(0xff025273),
                              fontSize: 13,
                            ),
                          ),
                        )
                      : Container(),
                  SizedBox(height: 6),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        extraTitle.toString(),
                        style: TextStyle(
                          color: Color(0xff025273),
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        taskNo.toString(),
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xff025273),
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        trailing.toString(),
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xff025273),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  isIcon
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width / 18,
                          child: IconButton(
                            onPressed: isIcon ? iconOnPressed : () {},
                            icon: Icon(Icons.info),
                            color: APPColors.Main.blue,
                          ),
                        )
                      : SizedBox(
                          width: MediaQuery.of(context).size.width / 18,
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
