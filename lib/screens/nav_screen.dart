import 'package:facebook_design/data/data.dart';
import 'package:facebook_design/screens/home_screen.dart';
import 'package:facebook_design/widgets/custom_app_bar.dart';
import 'package:facebook_design/widgets/custom_tab_bar.dart';
import 'package:facebook_design/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    FontAwesomeIcons.userCircle,
    FontAwesomeIcons.users,
    Icons.notifications_outlined,
    Icons.menu
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: Responsive.isDesktop(context)
            ? PreferredSize(
                preferredSize: Size(screenSize.width, 100.0),
                child: CustomAppBar(
                  currentUser: currentUser,
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) {
                    setState(() => _selectedIndex = index);
                  },
                ),
              )
            : null,
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        /*TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: _screens,
        ),*/
        bottomNavigationBar: !Responsive.isDesktop(context)
            ? Container(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: CustomTabBar(
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) {
                    setState(() => _selectedIndex = index);
                  },
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
