import 'friend.dart';
import 'user_comment.dart';
import 'user_post.dart';
import 'account.dart';

class UserData {
  List<UserPost> userList = [
    UserPost(
      userImg: 'assets/user1.jpg',
      username: 'Magnus Carlsen',
      time: '2 hours ago',
      postImg: 'assets/post1.jpg',
      postContent: 'This is a sample post content.',
      numComments: '10',
      numShare: '5',
      isLiked: false,
    ),
    UserPost(
      userImg: 'assets/user2.jpg',
      username: 'Bobby Fischer',
      time: '1 day ago',
      postImg: 'assets/post2.jpg',
      postContent: 'Another sample post content.',
      numComments: '20',
      numShare: '8',
      isLiked: false,
    ),
    UserPost(
      userImg: 'assets/user3.jpg',
      username: 'Vladimir Kramnik',
      time: '3 days ago',
      postImg: 'assets/post3.jpg',
      postContent: 'Yet another sample post content.',
      numComments: '15',
      numShare: '12',
      isLiked: true,
    ),
    UserPost(
      userImg: 'assets/user4.jpg',
      username: 'Garry Kasparov',
      time: '5 days ago',
      postImg: 'assets/post4.jpg',
      postContent: 'This is a sample post content.',
      numComments: '8',
      numShare: '3',
      isLiked: false,
    ),
  ];

  List<Friend> friendList = [
    Friend(img: 'assets/user1.jpg', name: 'Magnus Carlsen'),
    Friend(img: 'assets/user2.jpg', name: 'Bobby Fischer'),
    Friend(img: 'assets/user3.jpg', name: 'Vladimir Kramnik'),
    Friend(img: 'assets/user4.jpg', name: 'Garry Kasparov'),
  ];

  List<UserComment> commentList = [
    UserComment(
      commenterImg: 'assets/user1.jpg',
      commenterName: 'Magnus Carlsen',
      commentTime: '2 hours ago',
      commentContent: 'This is a sample comment.',
    ),
    UserComment(
      commenterImg: 'assets/user2.jpg',
      commenterName: 'Bobby Fischer',
      commentTime: '1 day ago',
      commentContent: 'Another sample comment.',
    ),
    UserComment(
      commenterImg: 'assets/user3.jpg',
      commenterName: 'Vladimir Kramnik',
      commentTime: '3 days ago',
      commentContent: 'Yet another sample comment.',
    ),
  ];

  Account myUserAccount = Account(
    name: 'Vladimir A. Tabudlong',
    email: 'vladimirtabudlong22@gmail.com',
    img: 'assets/user5.jpg',
    numFollowers: '1000',
    numPosts: '50',
    numFollowing: '200',
    numFriends: '150',
  );
}
