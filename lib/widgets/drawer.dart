import 'package:chat_ui/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsUlHESrnvWam4TqfvKmBKosNH751QWGegLhsTIH0kAqwEonOSL4bybhsywTlIHK6IdVM&usqp=CAU";
    return Drawer(
      child: Container(
        color: Colors.blueGrey,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(color: Colors.blueGrey),
                accountName: Text(
                  "Lalit Chataut",
                  style: TextStyle(color: Colors.white),
                  textScaleFactor: 1.2,
                ),
                accountEmail: Text(
                  "lalitchataut15@gmail.com",
                  style: TextStyle(color: Colors.white),
                  textScaleFactor: 1.2,
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              onTap:() => Navigator.push(
                  context,
                   MaterialPageRoute(
                    builder: (_)=> HomeScreen( ),
                ),
              ),
              // onTap: () {
              //   RecentChats();
              // },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              onTap:() => Navigator.push(
                  context,
                   MaterialPageRoute(
                    builder: (_)=> HomeScreen( ),
                ),
              ),
              //  onTap: () => Navigator.pushNamed(context, MyRoutes.profileRoute),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Email",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              // onTap: () => Navigator.pushNamed(context, MyRoutes.profileRoute),
               onTap:() => Navigator.push(
                  context,
                   MaterialPageRoute(
                    builder: (_)=> HomeScreen( ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.bell,
                color: Colors.white,
              ),
              title: Text("Notification",
                  textScaleFactor: 1.2, style: TextStyle(color: Colors.white)),
               onTap:() => Navigator.push(
                  context,
                   MaterialPageRoute(
                    builder: (_)=> HomeScreen( ),
                ),
              ),
              //   onTap:() =>  Navigator.pushNamed(context, MyRoutes.homeRoute),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.settings,
                color: Colors.white,
              ),
              title: Text("Settings",
                  textScaleFactor: 1.2, style: TextStyle(color: Colors.white)),
               onTap:() => Navigator.push(
                  context,
                   MaterialPageRoute(
                    builder: (_)=> HomeScreen( ),
                ),
              ),
              //  onTap:() =>  Navigator.pushNamed(context, MyRoutes.homeRoute),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.bubble_left_bubble_right,
                color: Colors.white,
              ),
              title: Text("Help ",
                  textScaleFactor: 1.2, style: TextStyle(color: Colors.white)),
              onTap:() => Navigator.push(
                  context,
                   MaterialPageRoute(
                    builder: (_)=> HomeScreen( ),
                ),
              ),
              //onTap:() =>  Navigator.pushNamed(context, MyRoutes.helpRoute),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.power,
                color: Colors.white,
              ),
              title: Text("Logout",
                  textScaleFactor: 1.2, style: TextStyle(color: Colors.white)),
              onTap:() => Navigator.push(
                  context,
                   MaterialPageRoute(
                    builder: (_)=> HomeScreen( ),
                ),
              ),
              //onTap: () => Navigator.pushNamed(context, MyRoutes.loginRoute),
            )
          ],
        ),
      ),
    );
  }
}
