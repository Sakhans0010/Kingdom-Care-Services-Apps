import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryBackground,
        foregroundColor: AppColors.neutral900,
        title: Column(
          children: [
            Text(
              "John Smith",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
            SizedBox(height: 2),
            Text(
              "Manager",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(height: 1),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Chat messages
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(12),
                children: [
                  // Incoming message
                  _buildIncomingMessage(
                    avatarUrl:
                        "https://lh3.googleusercontent.com/aida-public/AB6AXuDhwCmt4SKvzC_ribX2hCbgSYcbrOe4pzj1ZwD4m3wJsVawnazGG7nx82pGhfpNRHMhGgAaApgUrv6OBRLcDdVvdF2WngDKBlszD-hf91uu-hShxHiTHClEIzWvY0ednV2SP3WP_tM7kt-UABTkj1C4ul_GByo8kLiyl6FcrJevCR5kr9AfPC58yJ2iIuDtLtANwp9y7hmCDtkVfq_3Qe9yVmo77DysXOD8S0JC7oOl_zsolOnbYXLsQ3zqn6rtvC75DQdqJOTLnkin",
                    message:
                        "Hi Sarah, hope you're having a good day. I wanted to check in and see how your shift is going. Please let me know if you need anything at all.",
                    time: "10:00 AM",
                  ),
                  const SizedBox(height: 14),
                  // Outgoing message
                  MessageWidget(
                    isFromCurrentuser: true,
                    message:
                        "Hi John, thanks for checking in! My shift is going well so far. I'm currently assisting a client with their daily routine. I'll let you know if anything comes up.",
                    time: "10:01 AM",
                  ),
                  const SizedBox(height: 14),
                  // Incoming message
                  _buildIncomingMessage(
                    avatarUrl:
                        "https://lh3.googleusercontent.com/aida-public/AB6AXuDBcGakPtGqRdZJqBUNC4XDG_KHKTLmUVkyfsz6x_RiAHxPLks-svT3MbpSADkvKLD01fWMGsV5rEGXbd67NjK11kCkJPBzdpAZTdJPjMOVPB18DRsZWVLDzYOszQvEK2BzqnChrPgEHdDfhBrAbJsYQU71KpuHEp4bzg3e5fOf4CtTXkQzGXlU_1M3waGjI3utgu-Q49_yCyienfeT0MDit9QJHMxwElsk1Jiuaokegl-px747uJuTl4TCm_Eo8afWVI__cr0UPU9M",
                    message:
                        "That's great to hear, Sarah! Keep up the excellent work. We appreciate your dedication to our clients. If you have any questions or concerns, don't hesitate to reach out.",
                    time: "10:02 AM",
                  ),
                ],
              ),
            ),

            // Message input
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Color(0xFFE5E7EB))),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Type a message...",
                        filled: true,
                        fillColor: Color(0xFFF0F4F8),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                      color: Color(0xFF1E90FF),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIncomingMessage({
    required String avatarUrl,
    required String message,
    required String time,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CircleAvatar(backgroundImage: NetworkImage(avatarUrl), radius: 16),
        const SizedBox(width: 8),
        Flexible(
          child: MessageWidget(
            isFromCurrentuser: false,
            message: message,
            time: time,
          ),
        ),
      ],
    );
  }
}

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    required this.isFromCurrentuser,
    required this.message,
    required this.time,
  });

  final bool isFromCurrentuser;
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isFromCurrentuser ? AppColors.primaryColor : Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(isFromCurrentuser ? 0 : 16),
              bottomLeft: Radius.circular(isFromCurrentuser ? 16 : 0),
            ),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)],
          ),
          child: Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.normal,
              color: isFromCurrentuser
                  ? AppColors.secondaryBackground
                  : AppColors.textColor,
            ),
          ),
        ),
        const SizedBox(height: 4),

        Align(
          alignment: isFromCurrentuser
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Text(time, style: Theme.of(context).textTheme.labelMedium),
        ),
      ],
    );
  }
}
