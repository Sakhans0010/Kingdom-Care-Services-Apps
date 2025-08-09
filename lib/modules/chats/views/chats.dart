import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/app_utils/app_images.dart';
import 'package:kingdom_care_services_app/app_utils/constants.dart';
import 'package:kingdom_care_services_app/modules/chats/widgets/user_chat_item.dart';
import 'package:kingdom_care_services_app/widgets/title_section_row.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
       padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: TitleSectionRow(title: "Chats"),
        ),
        SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            
            itemBuilder: (context, index) => UserChatItem(),
          ),
        ),
      ],
    );
  }
}


