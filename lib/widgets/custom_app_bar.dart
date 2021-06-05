import 'package:facebook_design/config/palette.dart';
import 'package:facebook_design/models/user_model.dart';
import 'package:facebook_design/widgets/circle_button.dart';
import 'package:facebook_design/widgets/custom_tab_bar.dart';
import 'package:facebook_design/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  final User? currentUser;
  final List<IconData> icons;
  final int? selectedIndex;
  final Function(int)? onTap;
  const CustomAppBar({
    Key? key,
    required this.currentUser,
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 65.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4.0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'facebook',
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
          ),
          Container(
            width: 600,
            height: double.infinity,
            child: CustomTabBar(
              icons: icons,
              selectedIndex: selectedIndex,
              onTap: onTap,
              isBottomIndicator: true,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UserCard(user: currentUser),
                const SizedBox(width: 12.0),
                CircleButton(
                  icon: Icons.search,
                  iconSize: 30.0,
                  onPressed: () => print('Search'),
                ),
                CircleButton(
                  icon: FontAwesomeIcons.facebookMessenger,
                  iconSize: 30.0,
                  onPressed: () => print('Messenger'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
