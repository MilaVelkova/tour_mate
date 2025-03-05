import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tour_mate/providers/UserProvider.dart';


class NewDiaryScreen extends StatefulWidget {
  @override
  _NewDiaryScreenState createState() => _NewDiaryScreenState();
}

class _NewDiaryScreenState extends State<NewDiaryScreen> {
  DatabaseReference ref = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL: "https://tourmate-db17f-default-rtdb.europe-west1.firebasedatabase.app/",
  ).ref("diaries");
  DateTime? selectedDate;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  var firstName = UserProvider().firstName;
  var lastName = UserProvider().lastName;

  void uploadDestinations() {
      ref.push().set({
        "title": titleController.text,
        "text":  contentController.text,
        "creator": {
          "firstName": firstName,
          "lastName": lastName,
        }
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(5, 191, 171, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(5, 191, 171, 1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Diary Title
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 40),
              child: Text(
                "Adventure Diary",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Allura",
                  fontSize: 56,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Date Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: SizedBox(
                height: 60,
                child: Card(
                  color: const Color.fromRGBO(228, 255, 221, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DateTimeFormField(
                    decoration: const InputDecoration(
                      labelText: 'Enter Date',
                      border: InputBorder.none,
                    ),
                    firstDate: DateTime.now().subtract(const Duration(days: 365)),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                    initialPickerDateTime: DateTime.now(),
                    onChanged: (DateTime? value) {
                      selectedDate = value;
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Title Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: SizedBox(
                height: 80,
                child: Card(
                  color: const Color.fromRGBO(255, 233, 224, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    title: TextField(
                      controller: titleController,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 26, color: Colors.blueGrey),
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Content Field
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 350,
                child: Card(
                  color: const Color.fromRGBO(255, 233, 224, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    controller: contentController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 24, color: Colors.black, height: 1.8),
                    decoration: const InputDecoration(
                      labelText: 'Write your diary...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Save & Upload Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Save Button
                  ElevatedButton(
                    onPressed: () {
                      if (titleController.text.isNotEmpty) {
                        uploadDestinations();
                        Navigator.pop(context, {
                          'title': titleController.text,
                          'date': selectedDate?.toIso8601String() ?? '',
                          'content': contentController.text,
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(5, 41, 60, 1),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "SAVE",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),

                  // Upload Photo Button (Optional)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/selectPhoto');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(5, 41, 60, 1),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Upload Photo",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
