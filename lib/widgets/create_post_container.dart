import 'package:facebook_design/models/user_model.dart';
import 'package:facebook_design/widgets/profile_avatar.dart';
import 'package:facebook_design/widgets/responsive.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;
  const CreatePostContainer({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        padding: const EdgeInsets.only(
            left: 12.0, top: 8.0, right: 12.0, bottom: 0.0),
        color: isDesktop ? Colors.transparent : Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(imageUrl: currentUser.imageUrl),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: 'What\'s on your mind?'),
                  ),
                )
              ],
            ),
            const Divider(height: 10.0, thickness: 0.5),
            Container(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => print('Live'),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.videocam,
                            color: Colors.red,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            'Live',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                  const VerticalDivider(width: 8.0),
                  TextButton(
                    onPressed: () => print('Photo'),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.photo_library,
                            color: Colors.green,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            'Photo',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                  const VerticalDivider(width: 8.0),
                  TextButton(
                    onPressed: () => print('Room'),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.video_call,
                            color: Colors.purpleAccent,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            'Room',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
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
}
