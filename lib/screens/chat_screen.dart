import 'dart:convert';

import 'package:chat_ui/models/message_model.dart';
import 'package:chat_ui/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatScreen extends StatefulWidget {
  final User user;
  ChatScreen({required this.user});
  //we did this because we want user name to show on appbar

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isLoading = true;
  List items = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchTodo();
  }

  TextEditingController messageController = TextEditingController();
  _buildMessage(Message message, bool isMe) {
    //here we wrapped container with the row to add heart sign as whole message is a row
    return Row(
      children: [
        Container(
          margin: isMe
              ? EdgeInsets.only(top: 7, bottom: 7, left: 80)
              : EdgeInsets.only(
                  top: 7,
                  bottom: 7,
                ),
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: BoxDecoration(
            color: isMe
                ? Theme.of(context).colorScheme.secondary
                : Color(0xFFFFEFEE),
            // borderRadius: isMe
            //     ? BorderRadius.all(
            //  Radius.circular(15),
            //
            //       )
            //     : BorderRadius.only(
            //         topRight: Radius.circular(15),
            //         bottomRight: Radius.circular(15),
            //       ),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.time,
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                message.text,
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        //here we added !isMe because we dont wnat to show like message option for our option as well
        !isMe
            ? IconButton(
                icon: message.isLiked
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
                iconSize: 25,
                color: message.isLiked ? Colors.red : Colors.blueGrey,
                onPressed: (() {}))
            : SizedBox.shrink(),
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: Colors.white,
      child: Row(children: [
        IconButton(
          icon: Icon(Icons.photo),
          iconSize: 30,
          color: Colors.blueGrey,
          onPressed: () {},
        ),
        Expanded(
            child: TextField(
          textCapitalization: TextCapitalization.sentences,
          onChanged: (value) {},
          controller: messageController,
          decoration: InputDecoration.collapsed(hintText: 'message'),
        )),
        IconButton(
            icon: Icon(Icons.send),
            iconSize: 25,
            color: Colors.blueGrey,
            onPressed: () {
              submitData();
              fetchTodo();
            })
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          widget.user.name,
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
        // actions: <Widget>[
        //   IconButton(
        //       icon: Icon(Icons.more_horiz),
        //       iconSize: 30.0,
        //       color: Colors.white,
        //       onPressed: (() {})),
        // ]),
      ),
      body: GestureDetector(
        //we here wrapped column with GestureDetector and used onTap following code
        //the only function of this code is to minimize the keyboard when we tap the screen after writting
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                ),
                //
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),

                  child: RefreshIndicator(
                    onRefresh: fetchTodo,
                    child: ListView.builder(
                        itemCount: items.length,
                        padding: EdgeInsets.only(left: 15, right: 12, top: 12),
                        itemBuilder: (context, index) {
                          final item = items[index] as Map;
                          final id = item['_id'] as String;
                          return Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Color.fromARGB(255, 235, 237, 238),
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: ListTile(
                              title: Text(item['title']),
                              
                              onLongPress:  (){
                                  deleteById(id);
                                  
                                },
                              // trailing: PopupMenuButton(

                              //   onSelected: (value) {
                              //     if (value == 'delete') {
                              //       deleteById(id);
                              //     }
                              //   },
                              //   itemBuilder: (context) {
                              //     return [
                              //       PopupMenuItem(
                              //         child: Text('delete'),
                              //         value: 'delete',
                              //       )
                              //     ];
                              //   },
                              // ),
                              //  title: Text(item['title'], ),
                            ),
                          );
                        }),
                  ),
                  // child: ListView.builder(
                  //   reverse: true,
                  //   //this reverse reverses the order of meaasages from bottom to top
                  //   padding: EdgeInsets.only(top: 15),
                  //   itemCount: messages.length,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     final Message message = messages[index];
                  //     final bool isMe = message.sender.id == currentUser.id;
                  //     return _buildMessage(message, isMe);
                  //     //here we returned _buildMessage function which message and a bool isMe
                  //     //this function is then defined above
                  //   },
                  // ),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }

  Future<void> submitData() async {
    //get the data from
    final title = messageController.text;
    final body = {
      "title": title,
      "is_completed": false,
    };

    //submit data to server
    final url = 'https://api.nstack.in/v1/todos';
    final uri = Uri.parse(url);
    final response = await http.post(uri, body: jsonEncode(body), headers: {
      'Content-Type': 'application/json',
    });
    //show success or fail message based on status
    if (response.statusCode == 201) {
      messageController.text = '';

      // showSuccessMessage('Creation success');
    } else {
      // showErrorMessage('Creation failed');
    }
    print(response.statusCode);
    print(response.body);
  }

  Future<void> fetchTodo() async {
    final url = 'https://api.nstack.in/v1/todos?page=1&limit=20';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['items'] as List;
      setState(() {
        items = result;
      });
    }
    // print(response.statusCode);
    // print(response.body);
    setState(() {
      isLoading = false;
    });
  }

  Future<void> deleteById(String id) async {
    //delete the item
    //remove the item from list
    final url = 'https://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    if (response.statusCode == 200) {
      //here data will be already deleted.
      //we write this code to show all other data that are not deleted to fast load after deleting
      final filtered = items.where((element) => element['_id'] != id).toList();
      setState(() {
        items = filtered;
      });
    } else {
      //error
    }
  }
}
