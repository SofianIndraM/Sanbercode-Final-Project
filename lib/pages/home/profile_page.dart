import 'package:final_project/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    PreferredSizeWidget appBar() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'My Profile',
          style: whiteTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 18,
          ),
        ),
        elevation: 0,
        backgroundColor: blueColor,
      );
    }

    Widget content() {
      return ListView(
        children: [
          Center(
            child: Column(
              children: [
                //NOTE: FOTO PROFIL
                Container(
                  margin: EdgeInsets.only(
                    top: defaultMargin,
                  ),
                  child: Image.asset(
                    'assets/profile_photo.png',
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Sofian Indra Maulana',
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 16,
                  ),
                ),
                //NOTE: EMAIL
                Container(
                  margin: EdgeInsets.only(
                    top: 24,
                    left: defaultMargin,
                    right: defaultMargin,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 19,
                    vertical: 16,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: backgroundColor2,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: blueColor.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(7, 8),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.email_outlined,
                        color: blueColor,
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: secondaryTextStyle.copyWith(
                                fontWeight: light,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              auth.currentUser!.email.toString(),
                              style: primaryTextStyle.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //NOTE: PHONE NUMBER
                Container(
                  margin: EdgeInsets.only(
                    top: 24,
                    left: defaultMargin,
                    right: defaultMargin,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 19,
                    vertical: 16,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: backgroundColor2,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: blueColor.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(7, 8),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone_in_talk,
                        color: blueColor,
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Phone Number',
                              style: secondaryTextStyle.copyWith(
                                fontWeight: light,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              '0814045140222',
                              style: primaryTextStyle.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //NOTE: ADDRESS
                Container(
                  margin: EdgeInsets.only(
                    top: 24,
                    left: defaultMargin,
                    right: defaultMargin,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 19,
                    vertical: 16,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: backgroundColor2,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: blueColor.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(7, 8),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/home.png',
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Address',
                              style: secondaryTextStyle.copyWith(
                                fontWeight: light,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Jl Kayumanis Timur No.18 Kel. Utan Kayu Selatan Kec. Matraman',
                              style: primaryTextStyle.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ), //NOTE: SOCIAL MEDIA
                Container(
                  margin: EdgeInsets.only(
                    top: 24,
                    left: defaultMargin,
                    right: defaultMargin,
                    bottom: defaultMargin,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 19,
                    vertical: 16,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: backgroundColor2,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: blueColor.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(7, 8),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Social Media',
                        style: blueTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/telegram.png',
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            '@opign101',
                            style: primaryTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/linkedin.png',
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Sofian Indra Maulana',
                            style: primaryTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/instagram.png',
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            'sofian__indra',
                            style: primaryTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(
                    top: 6,
                    bottom: 40,
                  ),
                  height: 48,
                  child: TextButton(
                    onPressed: () {
                      _signOut().then(
                        (value) => Navigator.pushNamedAndRemoveUntil(
                            context, '/sign-in', (route) => false),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 38,
                        vertical: 12,
                      ),
                      backgroundColor: Color(0xffAF0000),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Sign Out',
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: appBar(),
      body: content(),
    );
  }
}
