// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:metro_ticketing/constants.dart';
import 'route_detail_data.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:audioplayers/audioplayers.dart';

class RouteDetail extends StatefulWidget {
  const RouteDetail({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RouteDetail> {
  // final CategoriesScroller categoriesScroller = const CategoriesScroller();
  ScrollController controller = ScrollController();
  final player = AudioCache();
  bool closeTopContainer = false;
  double topContainer = 0;
  bool _isVisible = false;
  int prev_index = -1;
  Map shuttleData = {
    "route_name": "nil",
    "shuttle_name": "nil",
    "route": "nil"
  };
  final _formKey = GlobalKey<FormBuilderState>();

  List<Widget> itemsData = [];

  void showToast(int index) {
    shuttleData = SHUTTLE_DATA[index];
    if (!_isVisible) {
      setState(() {
        _isVisible = !_isVisible;
      });
    } else if (index == prev_index) {
      setState(() {
        _isVisible = !_isVisible;
      });
    } else if (index != prev_index) {
      setState(() {});
    }
    prev_index = index;
  }

  void getPostsData() {
    List<dynamic> responseList = SHUTTLE_DATA;
    List<Widget> listItems = [];
    for (var post in responseList) {
      listItems.add(Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post["route_name"],
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      post["route"],
                      style: const TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      post["shuttle_name"],
                      style: const TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          )));
    }
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Book Ticket"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: SizedBox(
          height: size.height,
          child: Column(
            children: <Widget>[
              Expanded(
                  child: ListView.builder(
                      controller: controller,
                      itemCount: itemsData.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        double scale = 1.0;

                        return GestureDetector(
                          child: Opacity(
                            opacity: scale,
                            child: Align(
                                heightFactor: 0.7,
                                alignment: Alignment.topCenter,
                                child: itemsData[index]),
                          ),
                          onTap: () => showToast(index),
                        );
                      })),

              AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                opacity: _isVisible ? 1 : 0,
                child: Container(
                  color: PrimaryLightColor,
                  width: double.infinity,
                  child: Visibility(
                    visible: _isVisible,
                    child: FormBuilder(
                      key: _formKey,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(shuttleData['route_name']),
                          Text(shuttleData['route']),
                          Text(shuttleData['shuttle_name']),
                          const Text("Ticket will be valid for 24 hours"),

                          ElevatedButton(
                            onPressed: () {
                              player.play('/audios/success.mp3');
                              print("here we are!");
                              Alert(
                                context: context,
                                type: AlertType.success,
                                title: "Confirmation",
                                desc: "Ticket Booked Successfully.",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "Ok",
                                      style: TextStyle(color: Colors.white, fontSize: 20),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    width: 120,
                                  )
                                ],
                              ).show();
                            },
                            child: const Text('BooK'),
                          ),
                          SizedBox(width: 2, height: 2,),
                          ElevatedButton(
                            onPressed: (){
                              setState(() {
                                _isVisible = !_isVisible;
                              });
                            },
                            style: ElevatedButton.styleFrom(primary: Colors.red),
                            child: Text("Cancel")),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}