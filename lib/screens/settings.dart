
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Settings extends StatefulWidget {
  // const Settings({.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isSwitched = false;
  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
  }

  bool isSwitched2 = false;
  void toggleSwitch2(bool value) {
    if (isSwitched2 == false) {
      setState(() {
        isSwitched2 = true;
      });
    } else {
      setState(() {
        isSwitched2 = false;
      });
    }
  }

  bool isSwitched3 = false;
  void toggleSwitch3(bool value) {
    if (isSwitched3 == false) {
      setState(() {
        isSwitched3 = true;
      });
    } else {
      setState(() {
        isSwitched3 = false;
      });
    }
  }

  bool isSwitched4 = false;
  void toggleSwitch4(bool value) {
    if (isSwitched4 == false) {
      setState(() {
        isSwitched4 = true;
      });
    } else {
      setState(() {
        isSwitched4 = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white)),
              const Text(" Settings",
                  style: TextStyle(
                      letterSpacing: 1.4,
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserat')),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text("Notifications",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:Colors.green,
                      letterSpacing: 1.4,
                      fontSize: 18,
                    )),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("General Notifications",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        )),
                    Transform.scale(
                      scale: 0.6,
                      child: CupertinoSwitch(
                        // trackColor: Colors.grey,
                        dragStartBehavior: DragStartBehavior.start,
                        thumbColor: Colors.white,
                        value: isSwitched,
                        onChanged: toggleSwitch,
                        activeColor: Colors.green,
                      ),
                    ),
                  ],
                ),
                Text(
                    "Notifications about offers, announcements, blog posts and diary",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 13,
                    )),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Meal Reminders",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        )),
                    Transform.scale(
                      scale: 0.6,
                      child: CupertinoSwitch(
                        // trackColor: Colors.grey,
                        dragStartBehavior: DragStartBehavior.start,
                        thumbColor: Colors.white,
                        value: isSwitched2,
                        onChanged: toggleSwitch2,
                        activeColor: Colors.green,
                      ),
                    ),
                  ],
                ),
                Text(
                    "Notifications about offers, announcements, blog posts and diary",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 13,
                    )),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Water Reminders",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        )),
                    Transform.scale(
                      scale: 0.6,
                      child: CupertinoSwitch(
                        // trackColor: Colors.grey,
                        dragStartBehavior: DragStartBehavior.start,
                        // thumbColor: greenColor,
                        value: isSwitched3,
                        onChanged: toggleSwitch3,
                        activeColor: Colors.white,
                      ),
                    ),
                  ],
                ),
                Text(
                    "Notifications about offers, announcements, blog posts and diary",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 13,
                    )),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Meditation Reminders",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        )),
                    Transform.scale(
                      scale: 0.6,
                      child: CupertinoSwitch(
                        // trackColor: Colors.grey,
                        dragStartBehavior: DragStartBehavior.start,
                        //thumbColor: greenColor,
                        value: isSwitched4,
                        onChanged: toggleSwitch4,
                        activeColor: Colors.green,
                      ),
                    ),
                  ],
                ),
                Text(
                    "Notifications about offers, announcements, blog posts and diary",
                    style: TextStyle(
                      color: Colors.green.withOpacity(0.6),
                      fontSize: 13,
                    )),
                const SizedBox(height: 15),
              ]),
        ));
  }
}
