import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_note_app/add_text_page.dart';

class HomePage extends StatelessWidget {

  List<Map<String, dynamic>> mdata = [
    {
    "color" : Color(0xffffab91),
     "titile" : "How to make your personal brand stand out online",
      "Date" : "May 21,2020"
  },
    {
      "color" : Color(0xffffcc80),
      "titile" : "How to make your personal brand stand out online",
      "Date" : "May 21,2020"
    },
    {
      "color" : Color(0xffe6ee9b),
      "titile" : "How to make your personal brand stand out online",
      "Date" : "May 21,2020"
    },
    {
      "color" : Color(0xff80deea),
      "titile" : "How to make your personal brand stand out online",
      "Date" : "May 21,2020"
    },
    {
      "color" : Color(0xffcf93d9),
      "titile" : "How to make your personal brand stand out online",
      "Date" : "May 21,2020"
    },
    {
      "color" : Color(0xfff48fb1),
      "titile" : "How to make your personal brand stand out online",
      "Date" : "May 21,2020"
    },
    {
      "color" : Color(0xff80cbc4),
      "titile" : "How to make your personal brand stand out online",
      "Date" : "May 21,2020"
    },
    {
      "color" : Color(0xffffcc80),
      "titile" : "How to make your personal brand stand out online",
      "Date" : "May 21,2020"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Notes",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                    child: Image.asset(
                  "asset/image/seracicon.png",
                  height: 40,
                  width: 40,
                )),
              ],
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: mdata.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                    mainAxisSpacing: 11,
                    crossAxisSpacing: 11,
                  ),
              
                  itemBuilder: (_,index){
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: mdata[index]['color'],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                           Center(
                             child: Text(
                               mdata[index]['titile'],
                             style: TextStyle(
                               color: Colors.black,
                               fontSize: 16,
                             ),textAlign: TextAlign.center,
                             ),
                           ),
                            Align(
                              alignment:Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  mdata[index]['Date'],
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.4),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPage()));
          // Add your onPressed logic here
        },
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 8.0,
        child: Icon(Icons.add),
      ),
    );
  }
}
