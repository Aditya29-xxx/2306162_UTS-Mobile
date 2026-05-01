import 'package:flutter/material.dart';

class QuestWidget extends StatefulWidget {
  final String quest;
  final String cost;
  final Color textColor;
  final IconData icon;

  const QuestWidget({
    super.key,
    required this.quest,
    required this.cost,
    required this.textColor,
    required this.icon,
  });

  @override
  State<QuestWidget> createState() => _QuestWidgetState();
}

class _QuestWidgetState extends State<QuestWidget> {
  bool isAccepted = false; // 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isAccepted) return; // 

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: const Text("Terima Quest"),
              content: Text(
                  "Apakah kamu ingin menerima quest \"${widget.quest}\"?"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Batal"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isAccepted = true; // 
                    });
                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Quest diterima!"),
                      ),
                    );
                  },
                  child: const Text("Terima"),
                ),
              ],
            );
          },
        );
      },

      borderRadius: BorderRadius.circular(16),
      child: Ink(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isAccepted
              ? Colors.green.withAlpha(40) // 
              : Colors.purpleAccent.withAlpha(40),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isAccepted
                ? Colors.green
                : Colors.purpleAccent.withAlpha(70),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isAccepted ? Colors.greenAccent : Colors.amberAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                isAccepted
                    ? Icons.check_circle // 
                    : widget.icon,       // 
                color: isAccepted ? Colors.green : Colors.amber,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.quest,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      decoration: isAccepted
                          ? TextDecoration.lineThrough // opsional coret
                          : null,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.cost,
                    style: TextStyle(
                      color: widget.textColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}