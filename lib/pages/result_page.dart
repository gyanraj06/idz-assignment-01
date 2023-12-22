import 'package:flutter/material.dart';
import 'package:idzassignment/database/info_db.dart';
import 'package:idzassignment/info.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Future<List<Info>>? futureInfos;
  final infoDB = InfoDB();

  @override
  void initState() {
    super.initState();

    fetchInfos();
  }

  void fetchInfos() {
    setState(() {
      futureInfos = infoDB.fetchAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<List<Info>>(
          future: futureInfos,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              final infos = snapshot.data!;

              return infos.isEmpty
                  ? const Center(
                      child: Text("No Data"),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),

                          //* Welcome Text

                          const Text(
                            "Registration Successful",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Artegra',
                            ),
                          ),
                          const Text(
                            "Your Details are Submitted successfully.",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey,
                              fontFamily: 'Artegra',
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),

                          //* Data Table
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DataTable(
                                columnSpacing: 9,
                                dataTextStyle: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Artegra',
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 14),
                                headingTextStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Artegra',
                                    overflow: TextOverflow.clip,
                                    fontSize: 14),
                                border: TableBorder.all(
                                  color: Colors.grey,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(7)),
                                ),
                                columns: const [
                                  DataColumn(
                                      label: Expanded(
                                    child: Center(
                                      child: Text(
                                        'Name',
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  )),
                                  DataColumn(
                                      label: Expanded(
                                          child: Center(
                                              child: Text('Birth Date')))),
                                  DataColumn(
                                      label: Expanded(
                                          child:
                                              Center(child: Text('Email Id')))),
                                ],
                                rows: infos
                                    .map((item) => DataRow(cells: [
                                          DataCell(ConstrainedBox(
                                              constraints:
                                                  const BoxConstraints(maxWidth: 100),
                                              child:
                                                  Text(item.name.toString()))),
                                          DataCell(Text(
                                              "${item.month} ${item.date}th ${item.year}")),
                                          DataCell(ConstrainedBox(
                                            constraints:
                                                const BoxConstraints(maxWidth: 100),
                                            child: Text(
                                              item.email.toString(),
                                            ),
                                          )),
                                        ]))
                                    .toList(),
                              ),
                            ],
                          ),

                          Container(),
                        ],
                      ),
                    );
            }
          },
        ),
      ),
    );
  }
}
