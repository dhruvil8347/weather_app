import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,

      ),
      backgroundColor: Color(0xFF000000),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                height: 40,
              ),

              Text("units", style: TextStyle(color: Colors.grey)),
              SizedBox(
                height: 15,
              ),

              SafeArea(
                child: Container(
                  height: 400,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Color(0xFF1a1a1a),
                    borderRadius: BorderRadius.circular(25),



                  ),
                  child: Column(
                    children: [

                    ],
                  ),
                ),
              ),

              SizedBox(height: 10,),

              Container(
                height: 120,
                width: 300,
                decoration: BoxDecoration(
                  color: Color(0xFF1a1a1a),
                  borderRadius: BorderRadius.circular(25),



                ),
                child: Column(
                  children: [

                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
