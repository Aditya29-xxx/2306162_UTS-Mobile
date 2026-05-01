import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderWidget extends StatelessWidget {
  final String name;
  final String role;
  final int level;
  final String rank;

  const HeaderWidget({super.key, required this.name, required this.role, required this.level, required this.rank});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color.fromARGB(255, 100, 6, 232), const Color.fromARGB(255, 2, 80, 34)],
          begin: .topStart,
          end: .bottomEnd
        ),
        borderRadius: BorderRadius.circular(16)
      ),
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/109644583?v=4"),
              ),
              Positioned(
                //right: 2,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    color: Colors.black,
                  ),
                  child: Text("Level $level",
                  style: TextStyle(
                    color: Colors.amberAccent,
                    fontSize: 15,
                    fontWeight: .bold
                  ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(width: 12,),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(name,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: .bold,
                  fontSize: 16
                ),
                ),
                Text(role,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14
                ),
                )
              ],
            ),
          ),
          Container(
            padding:  EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4)
            ),
            child: Text(rank, style : GoogleFonts.bubblegumSans(
              textStyle: TextStyle(
                color : Colors.redAccent,
                fontSize: 36,
                fontWeight: .bold
            )),
          )
          )

        ],
      ),
    );
  }
}