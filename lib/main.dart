import 'package:flutter/material.dart';
import 'package:Adityapermana_2306162_UTS/Pages/login_pages.dart';
import 'package:Adityapermana_2306162_UTS/Widget/quest_widgets.dart';
import 'package:Adityapermana_2306162_UTS/Widget/header_widget.dart';
import 'package:Adityapermana_2306162_UTS/Widget/chip_widgets.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adventure Guild',
      initialRoute: "/",
      onGenerateRoute: (datas){
        if(datas.name == "/") {
          if (datas.arguments == null || datas.arguments is! Map) {
            return MaterialPageRoute(builder: (context) => const LoginPages());
          }
          final args = Map<String, dynamic>.from(datas.arguments as Map);
          return MaterialPageRoute(
            builder: (context) => Home_page(userData: args),
          );
        }
      }
    );
  }
}

class Home_page extends StatelessWidget {
  final Map<String, dynamic> userData;
  const Home_page({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Adventure Guild",
          style: TextStyle(
            fontWeight: .bold,
            color: const Color.fromARGB(255, 44, 9, 217),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 222, 8, 8),
      ),
      body: Padding(
        padding: const EdgeInsetsGeometry.all(12),
        child: Column(
          children: [
            HeaderWidget(
              name: userData["name"],
              role: userData["job"],
              level: int.parse(userData["level"]),
              rank: userData["rank"]
            ),
            SizedBox(height: 12,),
            Row(
              spacing: 10,
              children: [
                ChipWidgets(color: Colors.red, label: "HP :", icon: Icons.favorite, value: 100),
                ChipWidgets(color: Colors.blue, label: "MP :", icon: Icons.watch, value: 50),
                ChipWidgets(color: Colors.yellow, label: "EXP :", icon: Icons.square, value: 2000),
              ],
            ),
            Text("Quest List "),
            SizedBox(height: 10),
            Column(
              spacing: 15,
              children: [
                QuestWidget(
                  quest: "Memburu 5 WIBU",
                  cost: "Reward : MANIAC",
                  textColor: const Color.fromARGB(255, 234, 7, 7),
                  icon: Icons.task_alt
                ),
                QuestWidget(
                  quest: "Berburu  8 GAY ",
                  cost: "Reward : SAVAGE ",
                  textColor: const Color.fromARGB(255, 227, 7, 44),
                  icon: Icons.task_alt
                ),
                QuestWidget(
                  quest: "Berburu 10 LESBI ",
                  cost: "Reward :  Legendary",
                  textColor: const Color.fromARGB(255, 217, 9, 9),
                  icon: Icons.task_alt
                )
              ],
            )
          ],
        ),
        ),
    );
  }
}