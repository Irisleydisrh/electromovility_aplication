import 'package:flutter/material.dart';
import 'widgets/charts_subpage.dart';
import 'widgets/sessions_subpage.dart';
//import 'package:syncfusion_flutter_charts/charts.dart';

class StadisticPage extends StatefulWidget {
  const StadisticPage({super.key});

  @override
  State<StadisticPage> createState() => _StadisticPageState();
}

class Info {
  final String value;
  final String label;

  Info(this.value, this.label);
}

List<Info> infoList = [
  Info('11.20Wh', 'TOTAL ENERGY'),
  Info('21h 22m', 'TOTAL TIME'),
  Info('0.40€', 'TOTAL COST'),
];

class _StadisticPageState extends State<StadisticPage>
    with TickerProviderStateMixin {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [const ChartsSubpage(), const SessionsSubpage()];

    List<Widget> infos = infoList
        .map((info) => Column(
              children: [
                Text(
                  info.value,
                  style: const TextStyle(
                      color: Color.fromRGBO(53, 184, 134, 1), fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  info.label,
                  style: const TextStyle(fontSize: 9),
                ),
              ],
            ))
        .toList();

    return Scaffold(
      appBar: StatisticsBar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: datePickFunction(),
            ),
            IndexedStack(
              index: selectedIndex,
              children: screens,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                  top: BorderSide(color: Colors.grey),
                  bottom: BorderSide(color: Colors.grey),
                )),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: infos,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  border: Border.all(
                      color: const Color.fromRGBO(53, 184, 134, 1), width: 3)),
              child: Column(
                children: [
                  TabBar(
                    onTap: ((value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    }),
                    labelColor: Colors.white,
                    unselectedLabelColor: const Color.fromRGBO(53, 184, 134, 1),
                    indicator: BoxDecoration(
                      color: const Color.fromRGBO(53, 184, 134, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(selectedIndex == 0 ? 50 : 0),
                        bottomLeft:
                            Radius.circular(selectedIndex == 0 ? 50 : 0),
                        topRight: Radius.circular(selectedIndex == 1 ? 50 : 0),
                        bottomRight:
                            Radius.circular(selectedIndex == 1 ? 50 : 0),
                      ),
                    ),
                    indicatorColor: const Color.fromRGBO(53, 184, 134, 1),
                    controller: TabController(
                      length: 2,
                      vsync: this,
                      initialIndex: selectedIndex,
                    ),
                    tabs: const [
                      Tab(
                        text: 'CHARTS',
                      ),
                      Tab(
                        text: 'SESSIONS',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Color.fromRGBO(53, 184, 134, 1)
          ]),
        ),
      ),
    );
  }

  //Methods
  Row datePickFunction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color.fromRGBO(53, 184, 134, 1))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
            child: GestureDetector(
              onTap: () => {
                Dialog(
                  child: DatePickerDialog(
                      initialDate: DateTime(2024),
                      firstDate: DateTime(2021),
                      lastDate: DateTime.now()),
                )
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: Color.fromRGBO(53, 184, 134, 1),
                  ),
                  Text('08/05/2024')
                ],
              ),
            ),
          ),
        ),
        const Icon(
          Icons.arrow_forward_sharp,
          color: Color.fromRGBO(53, 184, 134, 1),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color.fromRGBO(53, 184, 134, 1))),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  color: Color.fromRGBO(53, 184, 134, 1),
                ),
                Text('14/05/2024')
              ],
            ),
          ),
        ),
      ],
    );
  }

  PreferredSize StatisticsBar() {
    return PreferredSize(
      preferredSize: const Size(150, 150),
      child: Container(
        height: 800,
        decoration: const ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(1000, 150),
              bottomRight: Radius.elliptical(1000, 150),
            ),
          ),
          color: Color.fromRGBO(53, 184, 134, 1),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 10),
              child: IconButton(
                onPressed: () => {Navigator.pop(context)},
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(width: 140),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.5)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.bar_chart,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'STATISTICS',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
