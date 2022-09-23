import 'package:flutter/material.dart';
import 'package:traveling_app/models/filters.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  @override
  Widget build(BuildContext context) {
    Filters filters = Filters();
    return Scaffold(
      appBar: AppBar(
        title: const Text('الفلاتر'),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Icons.save),
        //   ),
        // ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  'الرحلات الصيفية',
                  'إظهار الرحلات في فصل الصيف',
                  filters.isInSammer,
                  (newValue) {
                    setState(() {
                      filters.setIsInSammer(newValue);
                    });
                  },
                ),
                buildSwitchListTile(
                  'الرحلات الشتوية',
                  'إظهار الرحلات في فصل الشتاء',
                  filters.isInWinter,
                  (newValue) {
                    setState(() {
                      filters.setIsInWinter(newValue);
                    });
                  },
                ),
                buildSwitchListTile(
                  'الرحلات العائلية',
                  'إظهار الرحلات العائلية',
                  filters.isForFamily,
                  (newValue) {
                    setState(() {
                      filters.setIsForFamily(newValue);
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSwitchListTile(String title, String subTitle, bool currentValue,
      Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: currentValue,
      onChanged: onChanged,
    );
  }
}
