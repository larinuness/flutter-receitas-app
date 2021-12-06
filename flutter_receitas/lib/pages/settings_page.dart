import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_receitas/components/main_drawer.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: Center(
        child: Text('Oi'),
      ),
    );
  }
}
