import 'package:chat_app/app/home/data/models/message_model.dart';
import 'package:chat_app/app/home/presentation/widgets/chat_bubble.dart';
import 'package:chat_app/core/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();

    CollectionReference messages = FirebaseFirestore.instance.collection(context
        .localization
        .messages); //to create collection or read data from collection if found
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          context.localization.chat_app,
          style: TextStyle(color: Colors.white, fontSize: 20.sp),
        ),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: messages.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MessageModel> messageList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messageList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ChatBubble(
                          message: messageList[index],
                        );
                      },
                      itemCount: messageList.length),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: messageController,
                    onFieldSubmitted: (value) {
                      messages.add({
                        'message': value,
                      });
                      messageController.clear();
                    },
                    decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.emoji_emotions),
                        ),
                        hintText: context.localization.hint_message,
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.send),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: const BorderSide(color: Colors.grey))),
                  ),
                ),
              ],
            );
          } else {
            return Text('Loading...');
          }
        },
      ),
    );
  }
}
