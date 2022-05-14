import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ripel_application/widget/list_view_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const RipleApp());
}

class RipleApp extends StatefulWidget {
  const RipleApp({Key? key}) : super(key: key);

  @override
  _RipleAppState createState() => _RipleAppState();
}

class _RipleAppState extends State<RipleApp>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Image.asset('images/riple_logo.png', height: 42),
            backgroundColor: Color.fromARGB(255, 123, 189, 124),
            elevation: 10,
            bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Colors.white,
                indicator: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Color.fromARGB(255, 53, 163, 110)),
                controller: controller,
                tabs: const [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Dashboard"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Lista"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Financeiro"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Calendário"),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(
            controller: controller,
            children: [
              const Icon(Icons.dashboard),
              ListViewWidget(),
              const Icon(Icons.dashboard),
              const Icon(Icons.calendar_month),
            ],
          ),
        ),
      );
}
