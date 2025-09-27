import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:kingdom_care_services_app/modules/chats/widgets/user_chat_item.dart';

class ChatsListScreen extends StatelessWidget {
  const ChatsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.secondaryBackground,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryBackground,
        foregroundColor: AppColors.neutral900,
        title: Text(
          'Chats',
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontSize: 22),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(Icons.search, color: Color(0xFF1C1C1E)),
          ),
        ],
      ),
      body: Container(
        color: AppColors.background,
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            UserChatItem(
              imageUrl:
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuDhwCmt4SKvzC_ribX2hCbgSYcbrOe4pzj1ZwD4m3wJsVawnazGG7nx82pGhfpNRHMhGgAaApgUrv6OBRLcDdVvdF2WngDKBlszD-hf91uu-hShxHiTHClEIzWvY0ednV2SP3WP_tM7kt-UABTkj1C4ul_GByo8kLiyl6FcrJevCR5kr9AfPC58yJ2iIuDtLtANwp9y7hmCDtkVfq_3Qe9yVmo77DysXOD8S0JC7oOl_zsolOnbYXLsQ3zqn6rtvC75DQdqJOTLnkin',
              name: 'John Smith',
              lastMessage: "That's great to hear, Sarah! Keep up...",
              time: '10:02 AM',
              isOnline: true,
            ),
            const SizedBox(height: 12),
            UserChatItem(
              imageUrl:
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuDBcGakPtGqRdZJqBUNC4XDG_KHKTLmUVkyfsz6x_RiAHxPLks-svT3MbpSADkvKLD01fWMGsV5rEGXbd67NjK11kCkJPBzdpAZTdJPjMOVPB18DRsZWVLDzYOszQvEK2BzqnChrPgEHdDfhBrAbJsYQU71KpuHEp4bzg3e5fOf4CtTXkQzGXlU_1M3waGjI3utgu-Q49_yCyienfeT0MDit9QJHMxwElsk1Jiuaokegl-px747uJuTl4TCm_Eo8afWVI__cr0UPU9M',
              name: 'Eleanor Vance',
              lastMessage: 'Can you please review the shift schedule...',
              time: '9:45 AM',
              unreadCount: 2,
            ),
          ],
        ),
      ),
    );
  }
}
