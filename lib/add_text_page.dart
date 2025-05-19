import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_note_app/dbhelper.dart';
import 'package:new_note_app/note_model.dart';

class AddPage extends StatefulWidget {
  final bool isUpdate;
  final int? nId;
  final String? title;
  final String? desc;

  const AddPage({
    super.key,
    this.isUpdate = false,
    this.nId,
    this.title,
    this.desc,
  });

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  DbHelper db = DbHelper.instance;

  @override
  void initState() {
    super.initState();
    // If it's an update, fill the controllers with the existing note's data
    if (widget.isUpdate) {
      titleController.text = widget.title ?? '';
      descController.text = widget.desc ?? '';
    }
  }

  void handleSaveOrUpdate() async {
    if (titleController.text.isNotEmpty && descController.text.isNotEmpty) {
      bool check = false;

      // If it's an update, ensure we have a valid id (nId should not be null)
      if (widget.isUpdate) {
        if (widget.nId == null) {
          // Handle error: id should not be null for update
          print('Error: No ID found for update');
          return;
        }
        check = await db.updateNotes(
          title: titleController.text,
          desc: descController.text,
          id: widget.nId!,
        );
      } else {
        check = await db.addTask(
          NoteModel(title: titleController.text, desc: descController.text)
        );
      }

      if (check) {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff3b3b3b),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.all(17),
                  ),
                  child: const Icon(Icons.arrow_back_ios_new_outlined),
                ),
                ElevatedButton(
                  onPressed: handleSaveOrUpdate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff3b3b3b),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.all(15),
                  ),
                  child: Text(
                    widget.isUpdate ? "Update" : "Save",
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            TextField(
              controller: titleController,
              style: const TextStyle(fontSize: 40, color: Colors.white),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Title",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: descController,
              maxLines: 7,
              style: const TextStyle(fontSize: 20, color: Colors.white),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Type something...",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

