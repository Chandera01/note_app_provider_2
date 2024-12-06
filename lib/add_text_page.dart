import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController desccontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color(0xff3b3b3b), // Button background color
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12)), // Circular button
                        padding: EdgeInsets.all(17),
                      ),
                      child: Icon(Icons.arrow_back_ios_new_outlined)),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color(0xff3b3b3b), // Button background color
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12)), // Circular button
                        padding: EdgeInsets.all(15),
                      ),
                      child: Text(
                        "Save",
                        style: TextStyle(fontSize: 20),
                      )),
                ],
              ),
              TextField(
                controller: titlecontroller,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Title"),
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: desccontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,hintText: "Type something..."),
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
