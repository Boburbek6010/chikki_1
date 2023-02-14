import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ColoredBox(
                color: Colors.red,
                child:  IconButton(onPressed: (){
                  context.setLocale(
                    const Locale("ru", "RU"),
                  );
                },
                  icon:const Text('RU'),
                ),
              ),
              ColoredBox(
                color: Colors.red,
                child:  IconButton(onPressed: (){
                  // locale.ru();
                  context.setLocale(
                    const Locale("uz", "UZ"),
                  );
                },
                  icon:const Text('UZ'),
                ),
              ),
              ColoredBox(
                color: Colors.red,
                child:  IconButton(onPressed: (){
                  // locale.ru();
                  context.setLocale(
                    const Locale("en", "EN"),
                  );
                },
                  icon:const Text('EN'),
                ),
              ),
            ],
          ),
        ],
        title: const Text('welcome').tr(),
      ),
      body: const YandexMap(
        nightModeEnabled: true,
      ),
    );
  }
}
