import 'package:flutter/material.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}
final _formkey = GlobalKey<FormState>();
final TextEditingController _namecontroller = TextEditingController();
final TextEditingController _levelcontroller = TextEditingController();
final TextEditingController _rankcontroller = TextEditingController();
final TextEditingController _jobcontroller = TextEditingController();
class _LoginPagesState extends State<LoginPages> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key:_formkey,
        child:Column(
          spacing: 10,
          children: [
            Text("Adventure Guild", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),

            TextFormField(
              controller: _namecontroller,
              decoration: InputDecoration(
                label: Text("NAMA"),
                hint: Text("Masukan Nama"),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2)
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2)
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2)
                ),
                border: OutlineInputBorder(),
              ),
              validator: (value){
                if (value == null || value.isEmpty){
                  return "Nama Tidak Boleh Kosong";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _levelcontroller,
              decoration: InputDecoration(
                label: Text("LEVEL"),
                hintText: "Masukan Level",
                border: OutlineInputBorder(),
              ),
              validator: (value){
                if (value == null || value.isEmpty){
                  return "Level Tidak Boleh Kosong";
                }
                if (int.tryParse(value) == null){
                  return "Level Harus Berupa Angka";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _rankcontroller,
              decoration: InputDecoration(
                label: Text("RANK"),
                hintText: "Masukan Rank",
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              controller: _jobcontroller,
              decoration: InputDecoration(
                label: Text("JOB"),
                hintText: "Masukan Job",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    Navigator.pushReplacementNamed(
                      context,
                      "/",
                      arguments : {
                        "name": _namecontroller.text,
                        "level": _levelcontroller.text,
                        "rank": _rankcontroller.text,
                        "job": _jobcontroller.text
                      },
                    );
                  }
                },
                child: Text("Welcome to Adventure Guild"),
              ),
            )
          ],
        )
      ),
    );
  }
}