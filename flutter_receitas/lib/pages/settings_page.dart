import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsPage extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChange;

  const SettingsPage(
      {Key? key, required this.onSettingsChange, required this.settings})
      : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _creatSwitch(
    String title,
    String subtitle,
    bool value,
    void Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      activeColor: Theme.of(context).colorScheme.primary,
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChange(settings);
      },
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text(
          'Configurações',
          style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              'Configurações',
              style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _creatSwitch(
                  'Sem Glúten',
                  'Só exibe refeições sem glúten',
                  settings.isGlutenFree,
                  (value) {
                    setState(
                      () {
                        settings.isGlutenFree = value;
                      },
                    );
                  },
                ),
                _creatSwitch(
                  'Sem Lactose',
                  'Só exibe refeições sem lactose',
                  settings.isLactoseFree,
                  (value) {
                    setState(
                      () {
                        settings.isLactoseFree = value;
                      },
                    );
                  },
                ),
                _creatSwitch(
                  'Vegana',
                  'Só exibe refeições vegana',
                  settings.isVegan,
                  (value) {
                    setState(
                      () {
                        settings.isVegan = value;
                      },
                    );
                  },
                ),
                _creatSwitch(
                  'Vegetariana',
                  'Só exibe refeições vegetariana',
                  settings.isVegetarian,
                  (value) {
                    setState(
                      () {
                        settings.isVegetarian = value;
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
