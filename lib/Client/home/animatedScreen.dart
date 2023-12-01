import 'package:codebooter_study_app/AppState.dart';
import 'package:flutter/material.dart';
import 'package:codebooter_study_app/Client/authentication/auth_service.dart';
import 'package:codebooter_study_app/utils/Dimensions.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

import '../../utils/Colors.dart';

class AnimatedDrawer extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 1, end: 0),
      duration: const Duration(milliseconds: 700),
      builder: (BuildContext context, double value, Widget? child) {
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(value * 0.4 * 0.2),
          alignment: Alignment.centerRight,
          child: Drawer(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(dimension.val20),
                bottomRight: Radius.circular(dimension.val20),
              ),
            ),
            backgroundColor: appState.isDarkMode
                ? AppColors.primaryColor
                : AppColors.lightModePrimary,
            width: dimension.screenWidth * 0.6,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: dimension.height250,
                    child: Column(
                      children: [
                        // SizedBox(height: dimension.val50),
                        SizedBox(
                          height: dimension.val60,
                        ),
                        ClipOval(
                          child: Image(
                            image: NetworkImage(_authService.getUserImage() ??
                                "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png"),
                            height: dimension.height100,
                            width: dimension.width105,
                            fit: BoxFit
                                .cover, // Ensure the image covers the circular area
                          ),
                        ),
                        SizedBox(
                          height: dimension.val20,
                        ),
                        Text(
                          _authService.getUserName() ?? "",
                          style: TextStyle(
                              fontSize: dimension.font20,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: dimension.val5,
                        ),
                        Text(
                          _authService.getUserEmail() ?? "",
                          style: TextStyle(
                              fontSize: dimension.font16,
                              fontWeight: FontWeight.w400),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  // ListTile(
                  //   leading: Icon(
                  //     Icons.home,
                  //     size: dimension.val25,
                  //   ),
                  //   horizontalTitleGap: dimension.val2,
                  //   title: Text('Home',
                  //       style: TextStyle(
                  //           fontSize: dimension.font16,
                  //           fontWeight: FontWeight.w400)),
                  //   onTap: () {
                  //     context.go('/homepage');
                  //   },
                  // ),
                  // ListTile(
                  //   leading: Icon(
                  //     Icons.laptop,
                  //     size: dimension.val25,
                  //   ),
                  //   horizontalTitleGap: dimension.val2,
                  //   title: Text('Courses',
                  //       style: TextStyle(
                  //           fontSize: dimension.font16,
                  //           fontWeight: FontWeight.w400)),
                  //   onTap: () {
                  //     context.go('/courses');
                  //   },
                  // ),
                  // ListTile(
                  //   leading: Icon(
                  //     Icons.work_outline_rounded,
                  //     size: dimension.val25,
                  //   ),
                  //   horizontalTitleGap: dimension.val2,
                  //   title: Text('Internship/Jobs',
                  //       style: TextStyle(
                  //           fontSize: dimension.font16,
                  //           fontWeight: FontWeight.w400)),
                  //   onTap: () {
                  //     context.go('/jobinternship');
                  //   },
                  // ),
                  // ListTile(
                  //   leading: Icon(
                  //     Icons.book_outlined,
                  //     size: dimension.val25,
                  //   ),
                  //   horizontalTitleGap: dimension.val2,
                  //   title: Text('Notes',
                  //       style: TextStyle(
                  //           fontSize: dimension.font16,
                  //           fontWeight: FontWeight.w400)),
                  //   onTap: () {
                  //     context.go('/notes');
                  //   },
                  // ),
                  // ListTile(
                  //   leading: Icon(
                  //     Icons.laptop_mac_rounded,
                  //     size: dimension.val25,
                  //   ),
                  //   horizontalTitleGap: dimension.val2,
                  //   title: Text('Interview Gem',
                  //       style: TextStyle(
                  //           fontSize: dimension.font16,
                  //           fontWeight: FontWeight.w400)),
                  //   onTap: () {
                  //     context.go('/interview');
                  //   },
                  // ),
                  // //divider
                  Divider(
                    height: dimension.val20,
                    thickness: dimension.val2,
                    indent: dimension.val20,
                    endIndent: dimension.val20,
                  ),

                  ListTile(
                    leading: Icon(
                      Icons.help_outlined,
                      size: dimension.val25,
                    ),
                    horizontalTitleGap: dimension.val2,
                    title: Text('Help',
                        style: TextStyle(
                            fontSize: dimension.font16,
                            fontWeight: FontWeight.w400)),
                    onTap: () {
                      context.go('/help');
                    },
                  ),
                  //contact us
                  ListTile(
                    leading: Icon(
                      Icons.email_outlined,
                      size: dimension.val25,
                    ),
                    horizontalTitleGap: dimension.val2,
                    title: Text('Contact Us',
                        style: TextStyle(
                            fontSize: dimension.font16,
                            fontWeight: FontWeight.w400)),
                    onTap: () {
                      const email = 'codebooter2022@gmail.com';
                      final url = 'mailto:$email';
                      launch(url);
                    },
                  ),

                  // Add your other list tiles here

                  ListTile(
                    leading: Icon(
                      Icons.logout,
                      size: dimension.val25,
                    ),
                    horizontalTitleGap: dimension.val2,
                    title: Text('Sign Out',
                        style: TextStyle(
                            fontSize: dimension.font16,
                            fontWeight: FontWeight.w400)),
                    onTap: () {
                      _authService.signOut(context);
                      context.go('/');
                    },
                  ),
                  //   ElevatedButton(
                  //     onPressed: () {
                  //       _authService.signOut(context);
                  //       context.go('/');
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       foregroundColor: Colors.white,
                  //       backgroundColor: const Color.fromARGB(255, 250, 250, 250),
                  //       elevation: dimension.val5,
                  //       shape: RoundedRectangleBorder(
                  //         side: BorderSide(
                  //             color: const Color.fromARGB(255, 19, 16, 16),
                  //             width: dimension.val2,
                  //             style: BorderStyle.solid),
                  //         borderRadius: BorderRadius.circular(32.0),
                  //       ),
                  //     ),
                  //     child: Text(
                  //       'Sign Out',
                  //       style: TextStyle(
                  //           color: Colors.black,
                  //           fontSize: dimension.font16,
                  //           fontWeight: FontWeight.w400),
                  //       textAlign: TextAlign.center,
                  //     ),
                  //   ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
