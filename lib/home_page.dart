  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:new_note_app/add_text_page.dart';
  import 'package:new_note_app/dbhelper.dart';
import 'package:new_note_app/note_model.dart';

  class HomePage extends StatefulWidget {

    @override
    State<HomePage> createState() => _HomePageState();
  }

  class _HomePageState extends State<HomePage> {
    List<NoteModel> mdata = [];
    final List<Color> noteColors = [
      Color(0xffe56997),
      Color(0xffbd97cb),
      Color(0xfffbc740),
      Color(0xff2d2b19),
    ];


    DbHelper db = DbHelper.instance;

    @override
    void initState() {
      super.initState();
      getNotes();
    }
    void getNotes() async{
     mdata = await db.fetchallTask();
     setState(() {

     });
    }

     /* {
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
      },*/
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
              mdata.isNotEmpty ? Expanded(
                child:
                GridView.builder(
                    itemCount: mdata.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisSpacing: 11,
                      crossAxisSpacing: 11,
                    ),

                  itemBuilder: (_, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: noteColors[index % noteColors.length],
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Avoid Spacer
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Title
                          Text(
                            mdata[index].title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          /// Description
                          Text(
                            mdata[index].desc,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),

                          /// Buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                                icon: Icon(Icons.edit, color: Colors.white, size: 20),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddPage(
                                        isUpdate: true,
                                        nId: mdata[index].id,
                                        title: mdata[index].title,
                                        desc: mdata[index].desc,
                                      ),
                                    ),
                                  ).then((_) => getNotes());
                                },
                              ),
                              SizedBox(width: 8),
                              IconButton(
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                                icon: Icon(Icons.delete, color: Colors.white, size: 20),
                                onPressed: () async {
                                  bool check = await db.deleteNote(id: mdata[index].id!);
                                  if (check) getNotes();
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },

                )) : Container(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddPage()),
            ).then((_) {
              setState(() {
                getNotes();
              });
            });
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
