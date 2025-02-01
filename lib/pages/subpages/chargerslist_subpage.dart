import 'package:flutter/material.dart';

class ChargerListPage extends StatefulWidget {
  const ChargerListPage({super.key});

  @override
  State<ChargerListPage> createState() => _ChargerListPageState();
}

class _ChargerListPageState extends State<ChargerListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(),
      backgroundColor: const Color.fromRGBO(53, 184, 134, 1),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 600,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                    itemCount: 5,
                    controller: PageController(viewportFraction: 0.7),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(53, 184, 134, 0.6),
                              ),
                              width: 300,
                              height: 150,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.white))),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Text(
                                          'PULSAR SN1532                             0',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Text(
                                        'AVAILABLE',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize MyAppbar() {
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
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 10),
              child: IconButton(
                onPressed: () => {},
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Color.fromRGBO(53, 184, 134, 1),
                  size: 30,
                ),
              ),
            ),
            const SizedBox(width: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color.fromRGBO(53, 184, 134, 1)))),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'WELCOME WALLBOX',
                      style: TextStyle(
                          color: Color.fromRGBO(53, 184, 134, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Disfruta la mejor experiencia de carga',
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
