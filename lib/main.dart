import 'package:flutter/material.dart';
import 'package:jujunmunawar_2306148_4/Pages/login_pages.dart';
import 'package:jujunmunawar_2306148_4/Widget/quest_widgets.dart';
import 'package:jujunmunawar_2306148_4/Widget/header_widget.dart';
import 'package:jujunmunawar_2306148_4/Widget/chip_widgets.dart';

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
            color: const Color.fromARGB(255, 242, 238, 237),
          ),
        ),
        backgroundColor: Colors.purpleAccent,
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
                ChipWidgets(color: Colors.blue, label: "MP :", icon: Icons.flash_on, value: 50),
                ChipWidgets(color: Colors.green, label: "EXP :", icon: Icons.star, value: 2000),
              ],
            ),
            Text("Quest List "),
            SizedBox(height: 10),
            Column(
              spacing: 15,
              children: [
                QuestWidget(
                  quest: "Memburu 10 Sucubus ",
                  cost: "Reward : Speell Mantra Legendary",
                  textColor: Colors.black,
                  icon: Icons.task_alt
                ),
                QuestWidget(
                  quest: "Berburu  5 Serapine ",
                  cost: "Reward : 10.000 EXP dan 5 orb",
                  textColor: Colors.black,
                  icon: Icons.task_alt
                ),
                QuestWidget(
                  quest: "Berburu raja iblis ",
                  cost: "Reward : Pedang Legendaris",
                  textColor: Colors.black,
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