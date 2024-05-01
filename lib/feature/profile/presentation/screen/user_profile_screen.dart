import 'package:flutter/material.dart';
import 'package:social_app/core/constants.dart';
import 'package:social_app/utils/app_padding/app_padding.dart';
import '../widget/my_posts_widget.dart';
import '../widget/profile_photo_and_cover.dart';
import '../widget/user_profile_info.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p4),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileImageWithCover(uId:currentUserId),
                UserProfileInformation(uId: currentUserId,),
                MyPosts(uId: currentUserId),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


