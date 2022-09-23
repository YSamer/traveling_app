import 'package:flutter/material.dart';
import 'package:traveling_app/components/colors.dart';
import 'package:traveling_app/data/app_data.dart';
import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/screens/filters/filters_screen.dart';
import 'package:traveling_app/screens/tabs/tabs_screen.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 80,
              width: double.infinity,
              alignment: Alignment.center,
              color: accentcolor,
              child: Text(
                'دليلك السياحي',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const SizedBox(height: 20),
            buildListTile(
              Icons.card_travel,
              'الرحلات',
              () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TabsScreen(),
                  ),
                );
              },
            ),
            buildListTile(
              Icons.filter_list,
              'الفلاتر',
              () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FiltersScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  ListTile buildListTile(IconData icon, String title, Function() onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'ElMessiri',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }
}
