import 'package:flutter/material.dart';
import 'package:flutter_socmed/views/profile_view.dart';
import '../model/user_data.dart';
import '../model/user_post.dart';

class PostList extends StatefulWidget {
  const PostList({super.key, required this.userData});
  
  final UserData userData;

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  var nameTxtStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  void goToPage(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }

  Widget buttons(BuildContext context, UserPost userPost) => Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Divider(color: Colors.grey),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: userPost.isLiked ? Colors.blue : Colors.grey,
              ),
              onPressed: () {setState(() {
                userPost.isLiked ? userPost.isLiked = false : userPost.isLiked = true;
              });},
              icon: const Icon(Icons.thumb_up, size: 20),
              label: Text('Like'),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey
              ),
              onPressed: () {
                goToPage(context, ProfileView(userPost: userPost));
              },
              icon: const Icon(Icons.chat_bubble_outline, size: 20),
              label: Text('Comment'),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey
              ),
              onPressed: () {},
              icon: const Icon(Icons.share, size: 20),
              label: Text('Share'),
            ),
          ],
        ),
      )
    ],
  );

  Widget postCount(UserPost userPost) => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text('${userPost.numComments} Comments'),
      const Text(''),
      const SizedBox(width: 20,),
      Text('${userPost.numShare} Shares'),
    ],
  );

  Widget postImage(UserPost userPost) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Container(
      height: 350,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(userPost.postImg),
          fit: BoxFit.fill,
        )
      ),
    )
  );

  Widget postHeader(UserPost userPost) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(userPost.userImg),
        )
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userPost.username, style: nameTxtStyle,),
          Row(
            children: [
              Text('${userPost.time} . '),
              const Icon(Icons.people, size: 18),
            ],
          )
        ],
      )
    ],
  );

  Widget showPost(UserPost userPost) => Column(
    children: [
      postHeader(userPost),
      Container(
        margin: const EdgeInsets.all(8),
        child: Row(
          children: [Text(userPost.postContent, style: nameTxtStyle )],
        ),
      ),
      postImage(userPost),
      postCount(userPost),
      const Divider(),
      buttons(context, userPost),
      SizedBox(height: 10, child: Container(color: Colors.grey)),
      const SizedBox(height: 15,),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.userData.userList.map((userPost) {
        return InkWell(
          onTap: () {
            goToPage(context, ProfileView(userPost: userPost));
          },
          child: showPost(userPost),
        );
      }).toList(),
    );
  }
}