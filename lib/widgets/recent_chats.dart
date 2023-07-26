import 'package:chat_ui/models/message_model.dart';
import 'package:chat_ui/screens/chat_screen.dart';
import 'package:flutter/material.dart';


class RecentChats extends StatelessWidget {
  const RecentChats({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: ListView.builder(
            itemCount :chats.length,
            itemBuilder: (BuildContext context, int index) {
              final Message chat = chats[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                   MaterialPageRoute(
                    builder: (_)=> ChatScreen( user: chat.sender,)
                ),
                ),
                 //we wrapped padding with gesturedetector to use ontap 
                child: Container(
                  margin: EdgeInsets.only(top: 5,bottom: 5, right: 20),
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 7),
                  decoration: BoxDecoration(
                    color:chat.unread? Color(0xFFFFEFEE) : Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(18),
                    bottomRight: Radius.circular(18), 
                  )
                  ),
                  
                  child: Row(
                    //this will give space between two rows,here we wrapped row with row to make two rows ,second one shows time and NEW
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 32,
                            backgroundImage: AssetImage(chat.sender.imageUrl),
                          ),
                          SizedBox(width: 10.0,),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(chat.sender.name,style: TextStyle(color: Colors.blueGrey, fontSize: 15.0,fontWeight: FontWeight.bold),),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width* 0.45,
                            child: Text(chat.text,style: TextStyle(color: Colors.black, fontSize: 15.0,fontWeight: FontWeight.w600
                            ),
                            overflow: TextOverflow.ellipsis,
                            ),
                          )
                           ],
                         ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(chat.time, style: TextStyle(color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          ),),
                          SizedBox(height: 10,),
                       chat.unread?   Container(
                            width: 40,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(30)
                            ),
                            alignment: Alignment.center,
                            child: Text('NEW',style: TextStyle(color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),)
                            ): Text('')
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
