import 'package:flutter/material.dart';
import 'add_student.dart';
import 'package:scaler_assignment/screen/home_screen/evaluate_score.dart';
import 'package:scaler_assignment/screen/home_screen/view_student.dart';
import 'package:side_navigation/side_navigation.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  MainViewState createState() => MainViewState();
}

class MainViewState extends State<MainView> {
  int selectedIndex = 0;

  List<Widget> screens = const [
    AddStudent(),
    EditStudent(),
    FilterStudent(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue.withOpacity(0.6),
                    Colors.purple.withOpacity(0.6)
                  ],
                ),
              ),
              child: SideNavigationBar(
                selectedIndex: selectedIndex,
                initiallyExpanded:
                    MediaQuery.of(context).size.width < 600 ? false : true,
                header: const SideNavigationBarHeader(
                  image: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text('Mentor', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),),
                  subtitle: SizedBox(),
                ),
                theme: SideNavigationBarTheme(
                  togglerTheme: const SideNavigationBarTogglerTheme(
                  expandIconColor: Colors.white,
                    shrinkIconColor: Colors.white,
                  ),
                  itemTheme: SideNavigationBarItemTheme(
                      selectedItemColor: Colors.white,
                      unselectedItemColor: Colors.blueGrey,
                      labelTextStyle:const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
                  ),
                  dividerTheme: SideNavigationBarDividerTheme.standard(),
      
                ),
                items: const [
                  SideNavigationBarItem(
                    icon: Icons.add,
                    label: 'Assign Students',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.edit,
                    label: 'Evaluate Score',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.person,
                    label: 'View Students',
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
            ),
            Expanded(
              child: screens[selectedIndex],
            )
          ],
        ),
      ),
    );
  }
}
