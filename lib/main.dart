import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:weather_in/Views/ios_main.dart';
import 'package:weather_in/repositories/data_repository.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => DataRepository(), child: const WeatherInApp()));
}

class WeatherInApp extends StatefulWidget {
  const WeatherInApp({super.key});

  @override
  State<WeatherInApp> createState() => _WeatherInAppState();
}

class _WeatherInAppState extends State<WeatherInApp> {
  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    final dataProvider = Provider.of<DataRepository>(context, listen: false);
    await dataProvider.initData();
  }

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Learn Cupertino - iOS',
      home: IosMain(),
    );
  }
}
