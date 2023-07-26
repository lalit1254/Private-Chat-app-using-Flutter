import 'package:chat_ui/models/user_model.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.isLiked,
    required this.unread,
  });
}

// final User currentUser = User(
//   id: 0,
//   name: 'current User',
//   imageUrl: 'assets/images/steven.jpg',
// );
final User KP  = User(
  id: 1,
  name: 'KP Oli',
  imageUrl: 'assets/images/KP.jpg',
);
final User Rabi = User(
  id: 2,
  name: 'Rabi',
  imageUrl: 'assets/images/Rabi.jpg',
);
final User manis = User(
  id: 3,
  name: 'Manish',
  imageUrl: 'assets/images/manis.jpg',
);
final User roshani = User(
  id: 4,
  name: 'Roshani',
  imageUrl: 'assets/images/roshani.jpg',
);
final User Sharuk = User(
  id: 5,
  name: 'Sharuk Khan',
  imageUrl: 'assets/images/sharuk.jpg',
);
final User Ex = User(
  id: 6,
  name: 'Ex',
  imageUrl: 'assets/images/Ex.jpg',
);
final User Salman = User(
  id: 7,
  name: 'Salman Khan',
  imageUrl: 'assets/images/salman.jpg',
);
final User Messi = User(
  id: 8,
  name: 'Messi',
  imageUrl: 'assets/images/messi.jpg',
);
List<User> favourites = [roshani, KP, Sharuk, manis, Salman, Rabi];

List<Message> chats = [

  Message(
      sender: roshani,
      time: '6:30 PM',
      text: 'Hey, start the conversation',
      isLiked: true,
      unread: false),
      Message(
      sender: Sharuk,
      time: '3:30 PM',
      text: 'hey there',
      isLiked: false,
      unread: false),
  Message(
      sender: KP,
      time: '7:30 PM',
      text: 'KP joined the chat',
      isLiked: false,
      unread: true),
  Message(
      sender: Salman,
      time: '2:30 PM',
      text: 'Salman joined the chat.',
      isLiked: true,
      unread: true),
  Message(
      sender: manis,
      time: '1:30 PM',
      text: 'Manish joined the chat.',
      isLiked: true,
      unread: false),
  

   Message(
      sender: Rabi,
      time: '3:50 PM',
      text: 'Rabi joined the chat.',
      isLiked: true,
      unread: true),
    Message(
      sender: Messi,
      time: '3:50 PM',
      text: 'Messi joined the chat',
      isLiked: true,
      unread: false),

    Message(
      sender: Ex,
      time: '3:50 PM',
      text: 'Ex joined the chat',
      isLiked: true,
      unread: true),

];

// List<Message> messages = [
//   Message(
//       sender: Ex,
//       time: '6:30 PM',
//       text: 'What are you doing',
//       isLiked: false, 
//       unread: false),
//   Message(
//       sender: currentUser,
//       time: '6:31 PM',
//       text: 'Nothing just chilling, n u',
//       isLiked: true, 
//       unread: true),
//    Message(
//       sender: Ex,
//       time: '6:32 PM',
//       text: 'Me to, how was your day',
//       isLiked: false, 
//       unread: false),
//   Message(
//       sender: currentUser,
//       time: '7:30 PM',
//       text: 'I dont know i dont remember exactly',
//       isLiked: true,
//       unread: true),
//   Message(
//       sender: Ex,
//       time: '7:33 PM',
//       text: 'Oo you are so dumb',
//       isLiked: true,
//       unread: false),
//   Message(
//       sender: currentUser,
//       time: '8:00 PM',
//       text: 'NO not as much as you, you think you are smart',
//       isLiked: false,
//       unread: true),
//   Message(
//       sender: currentUser,
//       time: '8:30 PM',
//       text: 'just go away',
//       isLiked: true,
//       unread: false),

//        Message(
//       sender: Ex,
//       time: '8:40 PM',
//       text: 'ok fine, Have you had dinner ',
//       isLiked: false,
//       unread: false),
//        Message(
//       sender: currentUser,
//       time: '8:50 PM',
//       text: 'yes, How about you',
//       isLiked: false,
//       unread: false),
//        Message(
//       sender: Ex,
//       time: '8:52 PM',
//       text: 'Yup i was just watching a movie after dinner ',
//       isLiked: true,
//       unread: false),
//        Message(
//       sender: Ex,
//       time: '8:53 PM',
//       text: 'Its really good movie',
//       isLiked: false,
//       unread: false),

// ];