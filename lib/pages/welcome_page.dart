// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:idzassignment/database/info_db.dart';
import 'package:idzassignment/info.dart';
import 'package:idzassignment/pages/result_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key, this.info});

  final Info? info;

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  TextEditingController name = TextEditingController();
  TextEditingController month = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController email = TextEditingController();
  int date_int = 0;
  int year_int = 0;

  @override
  void initState() {
    super.initState();
    name.text = widget.info?.name ?? '';
    email.text = widget.info?.email ?? '';
    month.text = widget.info?.month ?? '';
    date_int = widget.info?.date ?? 0;
    year_int = widget.info?.year ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),

                //* Welcome Text

                const Text(
                  "Welcome User",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Artegra',
                  ),
                ),
                const Text(
                  "Please enter your details.",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                    fontFamily: 'Artegra',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                //* Name Text Field

                const Text(
                  "Name",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'Artegra',
                      fontWeight: FontWeight.w600),
                ),
                TextField(
                  controller: name,
                  decoration: InputDecoration(
                    hintText: "Enter Your Name",
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),

                //* Birth Date Text Field

                const Text(
                  "Birth Date",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'Artegra',
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                      border: Border.all(color: Colors.grey)),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 60,
                          //decoration: BoxDecoration(color: Colors.blue),
                          child: Center(
                            child: TextField(
                              controller: month,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                hintText: "Month",
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                                alignLabelWithHint: true,
                                border: InputBorder.none,
                              ),
                            ),
                            // Text(
                            //   "Month",
                            //   style: TextStyle(
                            //       fontFamily: 'Artegra', color: Colors.grey),
                            // ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 60,
                          //decoration: BoxDecoration(color: Colors.blue),
                          child: Center(
                            child: TextField(
                              controller: date,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                hintText: "Date",
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                                alignLabelWithHint: true,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 60,
                          //decoration: BoxDecoration(color: Colors.blue),
                          child: Center(
                            child: TextField(
                              controller: year,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                hintText: "Year",
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                                alignLabelWithHint: true,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),

                //* Email ID text field
                const Text(
                  "Email Id",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'Artegra',
                      fontWeight: FontWeight.w600),
                ),
                TextField(
                  controller: email,
                  decoration: InputDecoration(
                    hintText: "Enter Your Email Id",
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  height: 45,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                  child: InkWell(
                    onTap: () async {
                      date_int = int.parse(date.text);
                      year_int = int.parse(year.text);
                      await InfoDB().create(
                          name: name.text,
                          date: date_int,
                          email: email.text,
                          month: month.text,
                          year: year_int);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResultPage(),
                        ),
                      );
                    },
                    child: const Center(
                        child: Text(
                      "Submit",
                      style: TextStyle(
                          fontFamily: 'Artegra',
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
