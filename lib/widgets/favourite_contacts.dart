import 'package:chat_ui/models/message_model.dart';
import 'package:chat_ui/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class favouriteContacts extends StatelessWidget {
  const favouriteContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      //here we first used return row as we wanted first row which is favourite contacts and three dot and we wrapped row
      //with column since we wanted 2 rows inside a column which is fav contact and the second container which is images part
      // now we wrapped column with padding to push everythhing little below.
      child: Column(
        // we wrapped padding with the column since there are two things one text and another pic section(two sections of a column)
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            //we wrapped row with the padding
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Favourite Contacts',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0),
                ),
                IconButton(
                  icon: Icon(Icons.more_horiz),
                  iconSize: 30,
                  color: Colors.blueGrey,
                  onPressed: () {},
                )
              ],
            ),
          ),
          //now we started second section
          Container(
            height: 120,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10),
              scrollDirection: Axis.horizontal,
              itemCount: favourites.length,
              itemBuilder: (BuildContext context, int index) {
                //we wrapped our column with padding to give padding between the circle avatars

                return GestureDetector(
                  onTap: () => Navigator.push(
                  context,
                   MaterialPageRoute(
                    builder: (_)=> ChatScreen( user: favourites[index],)
                ),
                ),
                //we wrapped padding with gesturedetector to use ontap 
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(favourites[index].imageUrl),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          favourites[index].name,
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
