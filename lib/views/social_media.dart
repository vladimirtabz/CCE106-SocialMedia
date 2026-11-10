import 'package:flutter/material.dart';
import '../model/user_data.dart';
import '../views/friend_list.dart';
import '../views/info_header.dart';
import '../views/main_header.dart';
import '../views/post_list.dart';

class SocialMedia extends StatefulWidget {
  const SocialMedia({super.key});

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  UserData userData = UserData();

  var followTxtStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        )
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          MainHeader(userData: userData),
          InfoHeader(userData: userData),
          FriendList(userData: userData),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Row(children: [Text('Posts', style: followTxtStyle,)],)
          ),
          const SizedBox(height: 20,),
          PostList(userData: userData),
        ]
      )
    );
  }
}