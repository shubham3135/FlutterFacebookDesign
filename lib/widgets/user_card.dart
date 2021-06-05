import 'package:facebook_design/models/user_model.dart';
import 'package:facebook_design/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final bool? isActive;
  final User? user;
  const UserCard({Key? key, required this.user, this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(
            imageUrl: user!.imageUrl,
            isActive: isActive,
          ),
          const SizedBox(width: 6.0),
          Flexible(
            child: Text(
              user!.name!,
              style: const TextStyle(fontSize: 16.0),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
